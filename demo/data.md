# Data demo (slides 13 + 14 + 15)

Four psql commands. One sentence each. Shows how Postgres queries structured columns and JSONB documents in the same query path.

## Setup (run once, before the talk)

```sh
cd app && bun run db:up
bun run db:psql
```

In the psql session:

```sql
set role app;
```

Then we'll set tenant context inside each transaction (so you stay in the same RLS-scoped story as the auth demo).

```
11111111-1111-1111-1111-111111111111   -- BrowserOS
```

---

## 1. Per-row schema in action

Each row carries the JSONB shape it actually needs. TypeScript files have `exports` + `loc`; Rust crates have `crate`.

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  select path, metadata from files order by path;
commit;
```

Returns 5 BrowserOS files. Different paths, different `metadata` shapes:

```
 app/(protected)/repos/page.tsx   | {"loc": 22, "exports": ["default"]}
 crates/agent-runtime/src/main.rs | {"crate": "agent-runtime"}
 crates/terminal-core/src/lib.rs  | {"crate": "terminal-core"}
 src/auth/middleware.ts           | {"loc": 28, "exports": ["authMiddleware"]}
 src/db/schema.ts                 | {"loc": 67, "exports": ["users", "teams", "files"]}
```

Say: *"Per-row schema. No `null` columns for the fields a row doesn't use."*

---

## 2. Extract values with `->>` and test paths with `?`

`->>` pulls a JSON value out as text. `?` asks "does this top-level key exist?".

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  select path, metadata->>'loc' as loc
  from files
  where metadata ? 'loc';
commit;
```

Returns the 3 TypeScript files that have a `loc` field; the Rust crates and Go file are silently filtered out.

Say: *"`->>` pulls a JSON value out as text. `?` filters down to rows that actually carry that key. Zero migrations to add a new field; zero pain to query an old one."*

---

## 3. Match a shape with `@>`

`@>` is the workhorse: *does this document contain this sub-document?* It does deep structural matching, including inside arrays.

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  select path, metadata->'exports' as exports
  from files
  where metadata @> '{"exports": ["users"]}';
commit;
```

Returns 1 row: `src/db/schema.ts`, whose `exports` array contains `"users"` alongside `"teams"` and `"files"`.

Say: *"`@>` is the workhorse. Whole sub-documents, array membership, nested keys — one operator. And there's a GIN index on `metadata` that makes this fast at scale."*

---

## 4. Mix a structured filter with a JSONB predicate

This is the Postgres-specific move: the relational filter (`language = 'typescript'`) and the JSONB predicate (`metadata @> '{"loc": 28}'`) compose in one plan. The planner picks the cheapest path across the column index, the GIN index, and the join graph.

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  select path, language, metadata->'exports' as exports
  from files
  where language = 'typescript'
    and metadata @> '{"loc": 28}';
commit;
```

Returns 1 row: `src/auth/middleware.ts`, the only TypeScript file with `loc = 28`.

Say: *"Structured filter, unstructured predicate, one query. This is what the slide meant by 'same engine.'"*

---

## If something breaks

| What you see | What to do |
|---|---|
| All queries return 0 rows | You forgot `set role app;`. Without it, RLS shows you nothing in `app.team_id` is unset. Run it and retry. |
| `permission denied for table files` | Same fix - `set role app;`. |
| `unexpected character` errors | psql may have eaten a paste. Re-run the command. |
| Container died | `cd app && bun run db:reset` then `bun run db:psql; set role app;`. Takes ~5 seconds. |

## Tight on time?

Run **1** and **3**. They land the two strongest beats: per-row schema, and structural matching with `@>`. The combined #4 needs more setup talk.

## One more thing (only if asked)

Want to prove the GIN index is real?

```sql
\d files
```

Look for: `"files_metadata_idx" gin (metadata)` in the index list. With more rows than this demo seed has, the planner picks it for `@>` queries. Five rows isn't enough for the planner to bother — it just does a seq scan, which is already fast at this size.
