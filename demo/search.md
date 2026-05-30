# Search demo (slides 19 + 20 + 21)

Four psql commands. One sentence each. Shows how Postgres handles full-text search (core) and vector search (pgvector extension) on the same row, then blends them.

## Setup (run once, before the talk)

```sh
cd app && bun run db:up
bun run db:psql
```

In the psql session:

```sql
set role app;
```

> **Note:** the seed embeds each row with a deterministic mock vector (`mock_embedding(...)` SQL function, md5 + sin). The vectors are NOT semantically meaningful. They let you demo the *shape* of vector queries; for real similarity, flip `LIVE_AI=true` in `app/.env` and point at a real model.

Team UUID you'll need:
```
11111111-1111-1111-1111-111111111111   -- BrowserOS
```

---

## 0. What we're searching across

Before the four queries, prove the table is real and the two search columns are wired up.

```sql
\d files
```

Look for these lines:
- `embedding | vector(384)` &nbsp;and&nbsp; `tsv | tsvector ... generated always as ... stored`
- Index list shows both: `files_embedding_idx hnsw (embedding vector_cosine_ops)` &nbsp;and&nbsp; `files_tsv_idx gin (tsv)`
- A `Policies:` footer with `files_team USING ((team_id = current_team_id()))`

Now show the rows the active tenant can see:

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  select path, language, length(content) as bytes
  from files
  order by path;
commit;
```

Returns 5 BrowserOS files. The Acme `main.go` is hidden by RLS.

Say: *"One table. One column for full-text, one column for vectors. Two indexes, one policy. Everything from here is one query against this."*

---

## 1. Full-text search with `ts_rank`

`websearch_to_tsquery` accepts Google-style queries (`-exclude`, `"phrase"`). `ts_rank` orders the hits by relevance.

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  select path, round(ts_rank(tsv, q)::numeric, 5) as rank
  from files, websearch_to_tsquery('english','jwt session') q
  where tsv @@ q
  order by rank desc;
commit;
```

Returns `src/auth/middleware.ts` - the only file in the team's repos that mentions both *jwt* and *session*.

Say: *"Full-text in core. GIN index on tsvector. The planner adds the RLS clause for free."*

---

## 2. Show *where* the words matched with `ts_headline`

`ts_headline` returns the matched text with the hits wrapped in `<b>` tags. Useful for chat UIs that want to cite the source.

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  select path,
    ts_headline('english', content, websearch_to_tsquery('english','server component'))
  from files
  where tsv @@ websearch_to_tsquery('english','server component');
commit;
```

Returns one row: `app/(protected)/repos/page.tsx` with the snippet `<b>Server</b> <b>Component</b>. Lists the repos belonging to the active team.`

Say: *"Same `tsvector` column, ranked AND highlighted in one round trip. No second service to call."*

---

## 3. Vector nearest-neighbour: "find files like this one"

Pick a file, use its embedding as the query, order by cosine distance. This is the canonical "similar items" RAG pattern.

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  with seed as (
    select embedding from files where path = 'src/auth/middleware.ts'
  )
  select f.path,
    round((1 - (f.embedding <=> s.embedding))::numeric, 4) as similarity
  from files f, seed s
  order by f.embedding <=> s.embedding
  limit 4;
commit;
```

Returns the seed file first (`similarity = 1.0000`), then the other team files ordered by cosine distance.

Say: *"`<=>` is the cosine-distance operator. The HNSW index makes this fast at any tenant size. With real embeddings, the order tells a semantic story."*

---

## 4. Hybrid: blend text rank and vector rank in one query

This is the actual RAG retrieval. CTE for the text hits, CTE for the vector hits, blend the ranks, sort.

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  with text_hits as (
    select id, ts_rank(tsv, q)::numeric as r
    from files, websearch_to_tsquery('english','authentication middleware') q
    where tsv @@ q
  ),
  vec_hits as (
    select id, (1 - (embedding <=> mock_embedding('authentication middleware')))::numeric as r
    from files
    order by embedding <=> mock_embedding('authentication middleware')
    limit 5
  )
  select f.path,
    round(coalesce(t.r, 0) * 0.5 + coalesce(v.r, 0) * 0.5, 4) as rank
  from files f
  left join text_hits t on t.id = f.id
  left join vec_hits  v on v.id = f.id
  order by rank desc
  limit 5;
commit;
```

Returns files ranked by the blended score - high when both shapes agree, lower when only one does.

Say: *"Text rank, vector rank, freshness, RLS - all one query, one plan. That's RAG, written in SQL."*

---

## If something breaks

| What you see | What to do |
|---|---|
| All queries return 0 rows | You forgot `set role app;`. Run it and retry. |
| `function mock_embedding does not exist` | Container needs a reseed: `bun run db:reset`. |
| Vector NN similarity values look random | They are - the seed uses md5-derived mock vectors. The demo is about query *shape*, not real semantic similarity. |
| psql disconnected | `bun run db:psql` and re-run `set role app;`. |

## Tight on time?

Run **1** and **4**. They land the two strongest beats: "full-text is one operator and an index" and "RAG is a CTE, not a service".

## One more thing (only if asked)

Want to prove the GIN and HNSW indexes are both there?

```sql
\d files
```

Look for these two lines in the index list:

```
"files_embedding_idx" hnsw (embedding vector_cosine_ops)
"files_tsv_idx" gin (tsv)
```

Both Postgres-native index types - one in core, one from the pgvector extension. Same planner, same `explain`, same operational story.
