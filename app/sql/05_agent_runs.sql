-- Agent runs: every model invocation, tool call, and error in one place.
--
-- `payload jsonb` is the full step tree (messages, tool calls, results,
-- citations). The `summary` extracted from the payload is what powers
-- text search via the generated tsvector. The embedding lets us find
-- "runs similar to this failure".

create table agent_runs (
  id           uuid primary key default gen_random_uuid(),
  team_id      uuid not null references teams(id) on delete cascade,
  message_id   uuid references messages(id) on delete set null,
  model        text not null,
  status       text not null check (status in ('queued', 'running', 'ok', 'failed', 'cancelled')),
  started_at   timestamptz not null default now(),
  finished_at  timestamptz,
  payload      jsonb not null,
  embedding    vector(384),
  tsv          tsvector generated always as
                 (to_tsvector('english',
                    coalesce(payload->>'summary', '') || ' ' ||
                    coalesce(payload->>'error_message', '')
                  )) stored
);

create index agent_runs_team_idx on agent_runs (team_id, started_at desc);
create index agent_runs_status_idx on agent_runs (status)
  where status in ('queued', 'running', 'failed');
create index agent_runs_tsv_idx on agent_runs using gin (tsv);
create index agent_runs_vec_idx on agent_runs
  using hnsw (embedding vector_cosine_ops);
