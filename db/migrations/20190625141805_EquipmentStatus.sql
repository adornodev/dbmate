-- migrate:up
CREATE TABLE equipment_status (
	id uuid NOT NULL,
	equipment_id uuid NULL,
	"timestamp" timestamp NULL,
	status varchar(50) NULL,
	remarks text NULL,
	remarks_user text NULL,
	CONSTRAINT equipment_status_pkey PRIMARY KEY (id),
	CONSTRAINT equipment_status_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE
);
CREATE INDEX equipment_status_equipment_id_idx ON equipment_status USING btree (equipment_id);

-- migrate:down
DROP INDEX IF EXISTS equipment_status_equipment_id_idx;
DROP TABLE equipment_status;
