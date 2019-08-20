-- migrate:up
CREATE TABLE area (
	id uuid NOT NULL,
	"name" varchar(50) NULL,
	plant_id uuid NULL,
	CONSTRAINT area_pkey PRIMARY KEY (id),
	CONSTRAINT area_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plant(id) ON DELETE CASCADE
);
CREATE INDEX area_name_idx ON area USING btree (name);
CREATE INDEX area_plant_id_idx ON area USING btree (plant_id);
-- migrate:down
DROP INDEX IF EXISTS area_name_idx;
DROP INDEX IF EXISTS area_plant_id_idx;
DROP TABLE area;
