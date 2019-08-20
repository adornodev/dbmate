-- migrate:up
CREATE TABLE maintenance_note (
	id uuid NOT NULL,
	equipment_id uuid NULL,
	opened_by varchar(50) NULL,
	description text NULL,
	note_number varchar(50) NULL,
	responsible_technician varchar(50) NULL,
	maintenance_date timestamp NULL,
	"cost" money NULL,
	measures_taken varchar(1000) NULL,
	parts_involved varchar(50) NULL,
	detected_symptoms varchar(50) NULL,
	code varchar(50) NULL,
	shutdown_duration_hour float8 NULL,
	maintenance_duration_hour float8 NULL,
	observation varchar(1000) NULL,
	note_type varchar(50) NULL,
	order_type varchar(50) NULL,
	CONSTRAINT maintenance_note_pkey PRIMARY KEY (id),
	CONSTRAINT maintenance_note_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE
);
CREATE INDEX maintenance_note_equipment_id_idx ON maintenance_note USING btree (equipment_id);
CREATE INDEX maintenance_note_note_number_idx ON maintenance_note USING btree (note_number);

-- migrate:down
DROP INDEX IF EXISTS maintenance_note_equipment_id_idx;
DROP INDEX IF EXISTS maintenance_note_note_number_idx;
DROP TABLE maintenance_note;
