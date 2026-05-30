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

-- A handful of files with deterministic mock embeddings (all zeros so the
-- demo runs without a model call). Replace with real embeddings in prod.
insert into files (repo_id, team_id, path, language, size_bytes, sha, content, metadata, embedding, embedded_at) values
  ('aaaa1111-aaaa-1111-aaaa-111111111111',
   '11111111-1111-1111-1111-111111111111',
   'src/auth/middleware.ts', 'typescript', 842,
   'sha256:abc1', 'export async function authMiddleware(req: Request) { /* ... */ }',
   '{"exports": ["authMiddleware"], "loc": 28}',
   array_fill(0::real, array[384])::vector, now()),
  ('aaaa1111-aaaa-1111-aaaa-111111111111',
   '11111111-1111-1111-1111-111111111111',
   'src/db/schema.ts', 'typescript', 1840,
   'sha256:abc2', 'import { pgTable, uuid, text, vector } from ''drizzle-orm/pg-core''; /* ... */',
   '{"exports": ["users", "teams", "files"], "loc": 67}',
   array_fill(0::real, array[384])::vector, now()),
  ('aaaa1111-aaaa-1111-aaaa-111111111111',
   '11111111-1111-1111-1111-111111111111',
   'app/(protected)/repos/page.tsx', 'typescript', 612,
   'sha256:abc3', 'export default async function ReposPage() { /* RSC, RLS-scoped */ }',
   '{"exports": ["default"], "loc": 22}',
   array_fill(0::real, array[384])::vector, now()),
  ('aaaa2222-aaaa-2222-aaaa-222222222222',
   '11111111-1111-1111-1111-111111111111',
   'crates/terminal-core/src/lib.rs', 'rust', 1240,
   'sha256:abc4', 'pub mod session; pub mod pty;',
   '{"crate": "terminal-core"}',
   array_fill(0::real, array[384])::vector, now()),
  ('aaaa2222-aaaa-2222-aaaa-222222222222',
   '11111111-1111-1111-1111-111111111111',
   'crates/agent-runtime/src/main.rs', 'rust', 2040,
   'sha256:abc5', 'fn main() { /* awaiting embedding */ }',
   '{"crate": "agent-runtime"}',
   null, null),
  ('bbbb1111-bbbb-1111-bbbb-111111111111',
   '22222222-2222-2222-2222-222222222222',
   'main.go', 'go', 720,
   'sha256:def1', 'package main; import "fmt"',
   '{"module": "main"}',
   array_fill(0::real, array[384])::vector, now());

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
