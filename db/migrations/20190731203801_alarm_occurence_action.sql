-- migrate:up
CREATE table if not exists "alarm_occurrence_action" (
  "alarm_occurrence_id" uuid,
  "action" text,
  "id" uuid,
  CONSTRAINT alarm_occurrence_action_pkey PRIMARY KEY (id),
  constraint alarm_occurrence_action_alarm_occurrence_fkey FOREIGN KEY (alarm_occurrence_id) REFERENCES alarm_occurrence(id) ON DELETE CASCADE 
);

-- migrate:down
drop table if exists alarm_occurrence_action;
