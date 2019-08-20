-- migrate:up
CREATE TABLE logbook_occurrence (
	id uuid NOT NULL,
	equipment_id uuid NULL,
	occurrence_id varchar(50) NULL,
	time_created timestamp NULL,
	occurrence_time timestamp NULL,
	summary text NULL,
	createdby varchar(50) NULL,
	responsible_technician varchar(50) NULL,
	details varchar(50) NULL,
	note_number varchar(50) NULL,
	severity int4 NULL,
	pending int4 NULL,
	shift varchar(50) NULL,
	shift_group varchar(50) NULL,
	CONSTRAINT logbook_occurrence_pkey PRIMARY KEY (id),
	CONSTRAINT logbook_occurrence_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE
);
CREATE INDEX logbook_occurrence_equipment_id_idx ON logbook_occurrence USING btree (equipment_id);
CREATE INDEX logbook_occurrence_note_number_idx ON logbook_occurrence USING btree (note_number);

-- migrate:down
DROP INDEX IF EXISTS logbook_occurrence_equipment_id_idx;
DROP INDEX IF EXISTS logbook_occurrence_note_number_idx;
DROP TABLE logbook_occurrence;
