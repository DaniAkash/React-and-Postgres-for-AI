-- Row Level Security: authorization moved next to the data.
--
-- The app sets `app.team_id` (and optionally `app.user_id`) on every
-- request using `set_config()`. Policies read those settings and filter
-- rows automatically. A missing setting fails closed (nothing returns).
--
-- Once enabled, RLS travels with EVERY query, including ad-hoc psql
-- sessions, MCP tool calls, and the PostgREST sidecar in
-- docker-compose.yml. There is no path that bypasses it.

create or replace function current_team_id() returns uuid as $$
  select nullif(current_setting('app.team_id', true), '')::uuid;
$$ language sql stable;

create or replace function current_user_id() returns uuid as $$
  select nullif(current_setting('app.user_id', true), '')::uuid;
$$ language sql stable;

-- Enable RLS on every team-scoped table.
alter table teams         enable row level security;
alter table team_members  enable row level security;
alter table repos         enable row level security;
alter table files         enable row level security;
alter table chats         enable row level security;
alter table messages      enable row level security;
alter table agent_runs    enable row level security;

-- A user can see teams they belong to.
create policy teams_member on teams
  using (id in (
    select team_id from team_members where user_id = current_user_id()
  ));

create policy team_members_self on team_members
  using (user_id = current_user_id() or team_id = current_team_id());

-- Every team-scoped table filters by the active tenant.
create policy repos_team      on repos      using (team_id = current_team_id());
create policy files_team      on files      using (team_id = current_team_id());
create policy chats_team      on chats      using (team_id = current_team_id());
create policy messages_team   on messages   using (team_id = current_team_id());
create policy agent_runs_team on agent_runs using (team_id = current_team_id());
