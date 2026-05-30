-- The app role.
--
-- RLS only applies to NON-SUPERUSER roles. The default `repo` role that
-- runs the migrations is a superuser, so it bypasses every policy - which
-- defeats the whole demo. The application connects as `app` instead,
-- which has just enough privileges to read and write the public schema
-- and is subject to every policy we wrote in 06_rls_policies.sql.
--
-- For a live demo from psql, run `set role app;` once after connecting.

do $$
begin
  if not exists (select 1 from pg_roles where rolname = 'app') then
    create role app login password 'app' nosuperuser nobypassrls;
  end if;
end $$;

grant usage on schema public to app;
grant select, insert, update, delete on all tables in schema public to app;
grant usage, select on all sequences in schema public to app;

-- Future tables created by migrations should also be accessible to `app`.
alter default privileges in schema public
  grant select, insert, update, delete on tables to app;
alter default privileges in schema public
  grant usage, select on sequences to app;
