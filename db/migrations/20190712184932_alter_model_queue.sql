-- migrate:up
alter table if exists model_queue add column if not exists processing_date timestamp;

-- migrate:down
alter table if exists model_queue drop column if exists processing_date;
