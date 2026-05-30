-- Files: the hero table.
--
-- One row per source file. Holds the content, a pgvector embedding for
-- semantic search, and a generated tsvector for full-text search. The
-- hybrid_search() function in 08_hybrid_search.sql combines both.
--
-- `metadata jsonb` is the unstructured-data story: per-file extracted
-- exports, imports, language-server symbols, etc. Indexed with GIN so
-- jsonb path queries are fast.

create table files (
  id           uuid primary key default gen_random_uuid(),
  repo_id      uuid not null references repos(id) on delete cascade,
  team_id      uuid not null references teams(id) on delete cascade,
  path         text not null,
  language     text,
  size_bytes   int  not null,
  sha          text not null,
  content      text not null,
  metadata     jsonb not null default '{}'::jsonb,
  embedding    vector(384),
  tsv          tsvector generated always as
                 (to_tsvector('english', coalesce(content, ''))) stored,
  embedded_at  timestamptz,
  updated_at   timestamptz not null default now(),
  unique (repo_id, path)
);

-- Vector index: HNSW for fast approximate nearest-neighbour search.
create index files_embedding_idx on files
  using hnsw (embedding vector_cosine_ops);

-- Full-text index: GIN over the generated tsvector.
create index files_tsv_idx on files using gin (tsv);

-- JSON path index: GIN over metadata for `metadata @> '{...}'` queries.
create index files_metadata_idx on files using gin (metadata);

-- Tenant scoping index.
create index files_team_repo_idx on files (team_id, repo_id, path);
