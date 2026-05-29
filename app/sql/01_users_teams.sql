-- Identity + tenancy.
--
-- Multi-tenancy is the substrate every later capability depends on.
-- Row Level Security in 06_rls_policies.sql reads `team_id` from a
-- session variable set by the app on each request.

create table users (
  id            uuid primary key default gen_random_uuid(),
  email         text unique not null,
  display_name  text,
  created_at    timestamptz not null default now()
);

create table teams (
  id          uuid primary key default gen_random_uuid(),
  name        text not null,
  slug        text unique not null,
  created_at  timestamptz not null default now()
);

create table team_members (
  team_id    uuid not null references teams(id) on delete cascade,
  user_id    uuid not null references users(id) on delete cascade,
  role       text not null default 'member'
              check (role in ('owner', 'admin', 'member')),
  joined_at  timestamptz not null default now(),
  primary key (team_id, user_id)
);

create index team_members_user_idx on team_members (user_id);
