-- Hybrid retrieval: vector + full-text, blended in SQL.
--
-- The agent calls this one function. Postgres runs the FTS scan and
-- the HNSW vector scan in parallel via CTEs, then a FULL OUTER JOIN
-- gives every candidate a score on both axes. Weights are caller-set
-- so the agent can tune intent vs precision per query.
--
-- RLS still applies, so the search only sees files the current team
-- is allowed to see. Permissions and retrieval are one query.

create or replace function search_files(
  q_text          text,
  q_embedding     vector(384),
  text_weight     numeric default 0.5,
  vector_weight   numeric default 0.5,
  freshness_days  int     default 30,
  k               int     default 10
)
returns table (
  file_id        uuid,
  repo_id        uuid,
  path           text,
  text_rank      numeric,
  vector_rank    numeric,
  freshness_rank numeric,
  rank           numeric
) as $$
  with text_hits as (
    select id, ts_rank(tsv, websearch_to_tsquery('english', q_text))::numeric as r
    from files
    where tsv @@ websearch_to_tsquery('english', q_text)
    order by r desc
    limit k * 4
  ),
  vector_hits as (
    select id, (1 - (embedding <=> q_embedding))::numeric as r
    from files
    where embedding is not null
    order by embedding <=> q_embedding
    limit k * 4
  ),
  candidates as (
    select coalesce(t.id, v.id) as id,
           coalesce(t.r, 0)     as text_r,
           coalesce(v.r, 0)     as vector_r
    from text_hits t
    full outer join vector_hits v on v.id = t.id
  )
  select
    f.id,
    f.repo_id,
    f.path,
    c.text_r,
    c.vector_r,
    greatest(0, 1 - extract(epoch from (now() - f.updated_at)) / (freshness_days * 86400))::numeric as fresh_r,
    (c.text_r * text_weight
     + c.vector_r * vector_weight
     + greatest(0, 1 - extract(epoch from (now() - f.updated_at)) / (freshness_days * 86400)) * 0.1
    )::numeric as rank
  from candidates c
  join files f on f.id = c.id
  order by rank desc
  limit k;
$$ language sql stable;
