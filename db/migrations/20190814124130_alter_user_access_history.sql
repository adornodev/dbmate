-- migrate:up

alter table user_access_history
add column if not exists out_time timestamp null;

-- migrate:down

alter table user_access_history
drop column if exists out_time;