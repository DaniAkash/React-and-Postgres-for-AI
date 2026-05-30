-- Demo seed: two teams, two users, two repos, a small set of files.
--
-- After loading, set `app.user_id` and `app.team_id` to see how RLS
-- changes what each user can read:
--
--   set local app.user_id = '00000000-0000-0000-0000-000000000001';
--   set local app.team_id = '11111111-1111-1111-1111-111111111111';
--   select count(*) from files;  -- BrowserOS files only
--
--   set local app.team_id = '22222222-2222-2222-2222-222222222222';
--   select count(*) from files;  -- 0 (you do not belong to Acme)

insert into users (id, email, display_name) values
  ('00000000-0000-0000-0000-000000000001', 'dani@browseros.ai', 'Dani Akash'),
  ('00000000-0000-0000-0000-000000000002', 'alex@acme.test',    'Alex Reviewer');

insert into teams (id, name, slug) values
  ('11111111-1111-1111-1111-111111111111', 'BrowserOS', 'browseros'),
  ('22222222-2222-2222-2222-222222222222', 'Acme',      'acme');

insert into team_members (team_id, user_id, role) values
  ('11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000001', 'owner'),
  ('22222222-2222-2222-2222-222222222222', '00000000-0000-0000-0000-000000000002', 'owner');

insert into repos (id, team_id, github_url, name, default_branch, ingest_status, files_total, files_indexed, metadata) values
  ('aaaa1111-aaaa-1111-aaaa-111111111111',
   '11111111-1111-1111-1111-111111111111',
   'github.com/browseros-ai/browseros', 'browseros', 'main',
   'ready', 3, 3,
   '{"language": "typescript", "stars": 1240}'),
  ('aaaa2222-aaaa-2222-aaaa-222222222222',
   '11111111-1111-1111-1111-111111111111',
   'github.com/DaniAkash/agent-terminal', 'agent-terminal', 'main',
   'ingesting', 2, 1,
   '{"language": "rust", "stars": 312}'),
  ('bbbb1111-bbbb-1111-bbbb-111111111111',
   '22222222-2222-2222-2222-222222222222',
   'github.com/acme/secret-vault', 'secret-vault', 'main',
   'ready', 1, 1,
   '{"language": "go", "private": true}');

-- A deterministic mock embedding so the search demo can run without a model
-- call. The vectors are NOT semantically meaningful - they let you show the
-- query shape and ordering, not real similarity. Swap with a real model when
-- you flip LIVE_AI=true.
create or replace function mock_embedding(input text)
returns vector(384) language sql immutable as $$
  with seed as (select md5(input) as h)
  select (
    array(
      select sin(
        get_byte(decode(h, 'hex'), (i % 16))::float * 0.07
        + i * 0.013
      )
      from generate_series(0, 383) as i
    )
  )::vector
  from seed;
$$;

-- Files with realistic multi-line content so full-text search has real
-- vocabulary to work with, and mock embeddings that vary per row.
insert into files (repo_id, team_id, path, language, size_bytes, sha, content, metadata, embedding, embedded_at) values
  ('aaaa1111-aaaa-1111-aaaa-111111111111',
   '11111111-1111-1111-1111-111111111111',
   'src/auth/middleware.ts', 'typescript', 842,
   'sha256:abc1',
   E'// Authentication middleware. Verifies the JWT, attaches the user,\n// and sets app.team_id so Row Level Security can scope every query.\nexport async function authMiddleware(req: Request) {\n  const token = req.headers.get(''authorization'')\n  const session = await verifyJwt(token)\n  await db.execute(`select set_config(''app.team_id'', $1, true)`, [session.teamId])\n  return session\n}',
   '{"exports": ["authMiddleware"], "loc": 28}',
   mock_embedding('authentication middleware jwt session row level security'), now()),
  ('aaaa1111-aaaa-1111-aaaa-111111111111',
   '11111111-1111-1111-1111-111111111111',
   'src/db/schema.ts', 'typescript', 1840,
   'sha256:abc2',
   E'// Drizzle schema for the Repo Companion. One file per table.\nimport { pgTable, uuid, text, vector, jsonb } from ''drizzle-orm/pg-core''\nexport const users = pgTable(''users'', { id: uuid().primaryKey(), email: text().unique() })\nexport const teams = pgTable(''teams'', { id: uuid().primaryKey(), name: text() })\nexport const files = pgTable(''files'', {\n  id: uuid().primaryKey(), team_id: uuid(),\n  path: text(), content: text(),\n  embedding: vector({ dimensions: 384 }),\n  metadata: jsonb()\n})',
   '{"exports": ["users", "teams", "files"], "loc": 67}',
   mock_embedding('drizzle schema pgtable users teams files vector jsonb columns'), now()),
  ('aaaa1111-aaaa-1111-aaaa-111111111111',
   '11111111-1111-1111-1111-111111111111',
   'app/(protected)/repos/page.tsx', 'typescript', 612,
   'sha256:abc3',
   E'// React Server Component. Lists the repos belonging to the active team.\n// RLS scopes the query via withTenant; no client cache, no fetch waterfall.\nexport default async function ReposPage() {\n  const repos = await withTenant(teamId, userId, (tx) => tx.select().from(repos))\n  return <RepoList repos={repos} />\n}',
   '{"exports": ["default"], "loc": 22}',
   mock_embedding('react server component list repos tenant withtenant rsc page'), now()),
  ('aaaa2222-aaaa-2222-aaaa-222222222222',
   '11111111-1111-1111-1111-111111111111',
   'crates/terminal-core/src/lib.rs', 'rust', 1240,
   'sha256:abc4',
   E'// Terminal core. Wraps a PTY and forwards bytes to a session.\npub mod session;\npub mod pty;\npub fn spawn_session(cmd: &str) -> Session {\n    let pty = Pty::open();\n    Session::new(pty, cmd)\n}',
   '{"crate": "terminal-core"}',
   mock_embedding('terminal pty session spawn shell rust pseudoterminal'), now()),
  ('aaaa2222-aaaa-2222-aaaa-222222222222',
   '11111111-1111-1111-1111-111111111111',
   'crates/agent-runtime/src/main.rs', 'rust', 2040,
   'sha256:abc5',
   E'// Agent runtime. Polls a job queue, dispatches tool calls, writes results.\n#[tokio::main]\nasync fn main() {\n    let pool = connect_postgres().await;\n    loop { dispatch_next_job(&pool).await; }\n}',
   '{"crate": "agent-runtime"}',
   mock_embedding('agent runtime job queue tokio dispatch tool calls async rust'), now()),
  ('bbbb1111-bbbb-1111-bbbb-111111111111',
   '22222222-2222-2222-2222-222222222222',
   'main.go', 'go', 720,
   'sha256:def1',
   E'// Acme secret vault. Stores encrypted blobs keyed by team.\npackage main\nimport (\n  "fmt"\n  "github.com/acme/secret-vault/storage"\n)\nfunc main() { fmt.Println(storage.OpenVault()) }',
   '{"module": "main"}',
   mock_embedding('go package main secret vault storage encryption'), now());

-- One BrowserOS chat with two messages so the join example on slide 10
-- has something to join across. Acme is intentionally chat-less so the
-- contrast is visible.
insert into chats (id, team_id, repo_id, user_id, title) values
  ('cccc1111-cccc-1111-cccc-111111111111',
   '11111111-1111-1111-1111-111111111111',
   'aaaa1111-aaaa-1111-aaaa-111111111111',
   '00000000-0000-0000-0000-000000000001',
   'Where is the auth middleware?');

insert into messages (chat_id, team_id, role, content) values
  ('cccc1111-cccc-1111-cccc-111111111111',
   '11111111-1111-1111-1111-111111111111',
   'user',
   'Find any auth-related code in this repo.'),
  ('cccc1111-cccc-1111-cccc-111111111111',
   '11111111-1111-1111-1111-111111111111',
   'assistant',
   'I see src/auth/middleware.ts. The auth handler is exported there.');
