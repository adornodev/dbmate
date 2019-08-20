-- migrate:up

alter table user_access_history
add column if not exists id uuid null;
update user_access_history
set id = uuid_generate_v4();
alter table user_access_history
add CONSTRAINT PK PRIMARY KEY (id);

-- migrate:down

alter table user_access_history
drop column if exists id;
