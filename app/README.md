# Repo Companion

The demo app for the talk **React + Postgres - The AI-Ready Stack You Already Know**.

Chat with your codebase. Built on Postgres for everything: auth, vectors, full-text, queues, realtime, and the auto-generated REST and GraphQL APIs. The Next.js side is the thinnest possible wrapper; the database is the spec.

## What's in the box

| Capability (slides 3-4) | Lands as |
|---|---|
| Authentication | `sql/06_rls_policies.sql` - Row Level Security on every table |
| REST / GraphQL APIs | `docker-compose.yml` - PostgREST and pg_graphql sidecars |
| Structured data | `sql/02_repos.sql` + `sql/03_files.sql` columns |
| Unstructured data | `files.metadata`, `messages.payload`, `agent_runs.payload` (jsonb) |
| Queues | `sql/09_jobs.sql` - graphile_worker with transactional enqueue |
| Search | `sql/08_hybrid_search.sql` - vector + FTS in one SQL function |
| Type-safety | `src/db/schema.ts` - Drizzle mirrors the SQL one-for-one |
| Realtime | `sql/07_realtime_triggers.sql` - LISTEN/NOTIFY from triggers |

## Running it

```sh
bun install
cp .env.example .env

# Postgres + PostgREST + pg_graphql, all wired up.
bun run db:up

# The SQL files in ./sql/ run automatically on first boot,
# so the schema, RLS policies, triggers, search function, and
# seed data are all loaded for you.

bun run dev          # http://localhost:3000  (RSC page, RLS-scoped)
# REST:     http://localhost:3001/repos
# GraphQL:  http://localhost:3002/graphiql
# psql:     bun run db:psql
```

## Demo recipes

### See RLS in action

```sh
bun run db:psql
```
```sql
set local app.team_id = '11111111-1111-1111-1111-111111111111';
select count(*) from files;   -- BrowserOS files

set local app.team_id = '22222222-2222-2222-2222-222222222222';
select count(*) from files;   -- 0 (you do not belong to Acme)
```

### Hybrid search from psql

```sql
set local app.team_id = '11111111-1111-1111-1111-111111111111';

select path, rank
from search_files(
  'auth middleware',
  array_fill(0::real, array[384])::vector(384),   -- mock embedding
  0.5, 0.5, 30, 5
);
```

### Realtime stream

```sql
listen file_embedded;
listen message_inserted;

-- In another psql session: insert a message, the first session gets notified.
```

### The auto-generated REST API

```sh
curl 'http://localhost:3001/repos?select=name,ingest_status&order=created_at.desc'
```

## File map

```
sql/
  00_extensions.sql        -- pgvector, pg_trgm, pgcrypto
  01_users_teams.sql       -- identity + tenancy
  02_repos.sql             -- imported GitHub repos
  03_files.sql             -- THE hero table (content + embedding + tsvector)
  04_chats_messages.sql    -- conversation history
  05_agent_runs.sql        -- jsonb-heavy run history
  06_rls_policies.sql      -- authentication moved next to the data
  07_realtime_triggers.sql -- LISTEN/NOTIFY without an event bus
  08_hybrid_search.sql     -- vector + FTS in one function
  09_jobs.sql              -- graphile_worker integration
  99_seed.sql              -- 2 teams, 3 repos, 6 files

src/
  db/
    schema.ts              -- Drizzle, mirrors sql/01-05
    client.ts              -- pool + withTenant(teamId, userId, fn)
  lib/
    embeddings.ts          -- deterministic mock; LIVE_AI=true for real calls
    search.ts              -- thin wrapper around search_files()
  app/
    layout.tsx
    page.tsx               -- RSC page demonstrating RLS-scoped queries
    globals.css

docker-compose.yml          -- postgres + postgrest + pg_graphql
drizzle.config.ts
```

## License

MIT.
