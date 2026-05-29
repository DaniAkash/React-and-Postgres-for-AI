-- Chats: a conversation thread with the agent, optionally scoped to one repo.
--
-- `messages.payload` carries tool calls, file citations, token usage,
-- and anything else the agent generated. JSONB lets the shape evolve
-- without migrations.

create table chats (
  id          uuid primary key default gen_random_uuid(),
  team_id     uuid not null references teams(id) on delete cascade,
  repo_id     uuid references repos(id) on delete set null,
  user_id     uuid not null references users(id),
  title       text,
  created_at  timestamptz not null default now()
);

create table messages (
  id          uuid primary key default gen_random_uuid(),
  chat_id     uuid not null references chats(id) on delete cascade,
  team_id     uuid not null references teams(id) on delete cascade,
  role        text not null check (role in ('user', 'assistant', 'tool')),
  content     text not null,
  payload     jsonb not null default '{}'::jsonb,
  created_at  timestamptz not null default now()
);

create index chats_team_idx on chats (team_id, created_at desc);
create index messages_chat_idx on messages (chat_id, created_at);
