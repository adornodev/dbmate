-- migrate:up
CREATE TABLE pdm_model_alarm (
	id uuid NOT NULL,
	alarm_id uuid NULL,
	pdm_model_id uuid NULL,
	threshold float8 NULL,
	threshold_description varchar(50) NULL,
	CONSTRAINT pdm_model_alarm_pkey PRIMARY KEY (id),
	CONSTRAINT pdm_model_alarm_alarm_id_fkey FOREIGN KEY (alarm_id) REFERENCES alarm(id) ON DELETE CASCADE,
	CONSTRAINT pdm_model_alarm_pdm_model_id_fkey FOREIGN KEY (pdm_model_id) REFERENCES pdm_model(id) ON DELETE CASCADE
);
CREATE INDEX pdm_model_alarm_alarm_id_idx ON pdm_model_alarm USING btree (alarm_id);
CREATE INDEX pdm_model_alarm_pdm_model_id_idx ON pdm_model_alarm USING btree (pdm_model_id);
-- migrate:down
DROP INDEX IF EXISTS pdm_model_alarm_alarm_id_idx;
DROP TABLE pdm_model_alarm;