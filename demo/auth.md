# Auth demo (slides 9 + 10)

Four psql commands. One sentence each.

## Setup (run once, before the talk)

```sh
cd app && bun run db:up
bun run db:psql
```

In the psql session:

```sql
set role app;
```

That's it. The seed is loaded, the `app` role makes RLS apply.

Two team UUIDs you'll need:
```
11111111-1111-1111-1111-111111111111   -- BrowserOS
22222222-2222-2222-2222-222222222222   -- Acme
```

---

## 1. Same query, BrowserOS

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  select count(*) from files;
commit;
```

Returns **5**. Say: *"No `WHERE` clause anywhere. Postgres scopes the read."*

---

## 2. Same query, Acme

```sql
begin;
  set local app.team_id = '22222222-2222-2222-2222-222222222222';
  select count(*) from files;
commit;
```

Returns **1**. Say: *"Same SQL. Different tenant. Different rows."*

---

## 3. Insert into the wrong tenant

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  insert into files (repo_id, team_id, path, language, size_bytes, sha, content)
  values ('aaaa1111-aaaa-1111-aaaa-111111111111',
          '22222222-2222-2222-2222-222222222222',
          'evil.ts', 'typescript', 100, 'sha:bad', 'leak');
rollback;
```

Returns `ERROR: new row violates row-level security policy for table "files"`. Say: *"I'm BrowserOS. I cannot plant a row in Acme's space."*

---

## 4. Forgotten WHERE clause

```sql
begin;
  set local app.team_id = '11111111-1111-1111-1111-111111111111';
  update files set updated_at = now() returning team_id, path;
rollback;
```

Returns **5 rows**, all `team_id = 1111…`. Say: *"No `WHERE`. The policy turned my bug into a no-op against the other tenant."*

---

## If something breaks

| What you see | What to do |
|---|---|
| `count(*)` returns 6 instead of 5 | You forgot `set role app;`. Run it and re-run the command. |
| psql disconnected | `bun run db:psql` and **run `set role app;` again**. |
| Container died | `cd app && bun run db:reset` then `bun run db:psql; set role app;`. Takes ~5 seconds. |

## Tight on time?

Just run **1** and **3**. They land the two strongest beats: same query different result, and write blocked.
