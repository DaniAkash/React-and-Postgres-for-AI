-- Repos: imported GitHub projects, owned by a team.
--
-- `ingest_status` is a simple state machine the queue worker advances.
-- `files_total` and `files_indexed` give the realtime UI live progress
-- without polling: a trigger fires NOTIFY whenever they change.

create table repos (
  id              uuid primary key default gen_random_uuid(),
  team_id         uuid not null references teams(id) on delete cascade,
  github_url      text not null,
  name            text not null,
  default_branch  text not null default 'main',
  ingest_status   text not null default 'pending'
                  check (ingest_status in ('pending', 'ingesting', 'ready', 'failed')),
  files_total     int  not null default 0,
  files_indexed   int  not null default 0,
  metadata        jsonb not null default '{}'::jsonb,
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now(),
  unique (team_id, github_url)
);

create index repos_team_idx on repos (team_id, created_at desc);
