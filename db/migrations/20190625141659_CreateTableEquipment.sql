-- migrate:up
CREATE TABLE equipment (
	id uuid NOT NULL,
	"template" json NULL,
	sub_area_id uuid NULL,
	CONSTRAINT equipment_pkey PRIMARY KEY (id),
	CONSTRAINT equipment_sub_area_id_fkey FOREIGN KEY (sub_area_id) REFERENCES sub_area(id) ON DELETE CASCADE
);
CREATE INDEX equipment_sub_area_id_idx ON equipment USING btree (sub_area_id);

-- migrate:down
DROP INDEX IF EXISTS equipment_sub_area_id_idx;
DROP TABLE equipment;
