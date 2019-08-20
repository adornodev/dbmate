-- migrate:up
CREATE TABLE maintenance_plan_history (
	id uuid NOT NULL,
	maintenance_plan_id uuid NULL,
	note_number varchar(50) NULL,
	responsible_technician varchar(50) NULL,
	due_date timestamp NULL,
	report_date timestamp NULL,
	conclusion_date timestamp NULL,
	sap_note_date timestamp NULL,
	order_type varchar(50) NULL,
	status varchar(50) NULL,
	CONSTRAINT maintenance_plan_history_pkey PRIMARY KEY (id),
	CONSTRAINT maintenance_plan_history_maintenance_plan_id_fkey FOREIGN KEY (maintenance_plan_id) REFERENCES maintenance_plan(id) ON DELETE CASCADE
);
CREATE INDEX maintenance_plan_history_maintenance_plan_id_idx ON maintenance_plan_history USING btree (maintenance_plan_id);
CREATE INDEX maintenance_plan_history_note_number_idx ON maintenance_plan_history USING btree (note_number);

-- migrate:down
DROP INDEX IF EXISTS maintenance_plan_history_maintenance_plan_id_idx;
DROP INDEX IF EXISTS maintenance_plan_history_note_number_idx;
DROP TABLE maintenance_plan_history;
