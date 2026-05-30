-- Background work: Postgres-native queues.
--
-- This file does NOT create a queue table by hand. We use graphile_worker
-- which installs its own schema:
--
--   bunx graphile-worker --connection "$DATABASE_URL" --schema-only
--
-- That creates `graphile_worker.jobs` plus support tables. Jobs are added
-- transactionally with the rest of your work:
--
--   begin;
--     insert into files (...) returning id;
--     perform graphile_worker.add_job('embed_file', json_build_object('file_id', id));
--   commit;
--
-- If the transaction rolls back, the job never runs. No outbox table, no
-- two-phase commit, no eventual consistency story to explain. The queue
-- is just rows in Postgres protected by the same MVCC that protects
-- everything else.

-- Convenience helper used by the file-update trigger to re-queue an
-- embedding job whenever the content sha changes.
create or replace function enqueue_embed_file() returns trigger as $$
begin
  if (tg_op = 'INSERT') or (old.sha is distinct from new.sha) then
    perform graphile_worker.add_job(
      'embed_file',
      json_build_object('file_id', new.id, 'team_id', new.team_id)
    );
  end if;
  return new;
end;
$$ language plpgsql;

-- Only attach the trigger if graphile_worker's schema is installed.
do $$
begin
  if exists (select 1 from pg_namespace where nspname = 'graphile_worker') then
    create trigger files_enqueue_embed
      after insert or update of sha on files
      for each row execute function enqueue_embed_file();
  end if;
end $$;
