-- migrate:up
CREATE TABLE alarm (
	id uuid NOT NULL,
	tag varchar(50) NULL,
	description text NULL,
	severity varchar(10) NULL,
	"type" varchar(20) NULL,
	equipment_id uuid NULL,
	variables json NULL,
	enabled bool NULL,
	CONSTRAINT alarm_pkey PRIMARY KEY (id),
	CONSTRAINT alarm_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE
);
CREATE INDEX alarm_equipment_id_idx ON alarm USING btree (equipment_id);

-- migrate:down
DROP INDEX IF EXISTS alarm_equipment_id_idx;
DROP TABLE alarm;
