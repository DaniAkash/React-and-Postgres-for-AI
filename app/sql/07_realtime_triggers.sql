-- Realtime: LISTEN / NOTIFY driven from triggers.
--
-- The app holds an open LISTEN connection per tenant. Triggers emit
-- a JSON payload on row changes, the app's RSC SSE stream forwards
-- them to the browser. No polling, no extra service, no event bus.

create or replace function notify_file_embedded() returns trigger as $$
begin
  if (old.embedded_at is null and new.embedded_at is not null) then
    perform pg_notify(
      'file_embedded',
      json_build_object(
        'team_id', new.team_id,
        'repo_id', new.repo_id,
        'file_id', new.id,
        'path',    new.path
      )::text
    );
  end if;
  return new;
end;
$$ language plpgsql;

create trigger files_embedded_notify
  after update of embedded_at on files
  for each row execute function notify_file_embedded();

create or replace function notify_message_inserted() returns trigger as $$
begin
  perform pg_notify(
    'message_inserted',
    json_build_object(
      'team_id',    new.team_id,
      'chat_id',    new.chat_id,
      'message_id', new.id,
      'role',       new.role
    )::text
  );
  return new;
end;
$$ language plpgsql;

create trigger messages_notify
  after insert on messages
  for each row execute function notify_message_inserted();
