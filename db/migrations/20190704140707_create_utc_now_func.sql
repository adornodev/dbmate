-- migrate:up
create or replace function now_utc() returns timestamp as $$
  select now() at time zone 'utc';
$$ language sql;

-- migrate:down
drop function if exists now_utc();
