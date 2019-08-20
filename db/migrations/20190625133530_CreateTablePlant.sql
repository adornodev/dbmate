-- migrate:up
CREATE TABLE plant (
	id uuid NOT NULL,
	"name" varchar(50) NULL,
	latitude float8 NULL,
	longitude float8 NULL,
	region_id uuid NULL,
	timezone varchar(250) NULL,
	CONSTRAINT plant_name_key UNIQUE (name),
	CONSTRAINT plant_pkey PRIMARY KEY (id),
	CONSTRAINT plant_region_id_fkey FOREIGN KEY (region_id) REFERENCES region(id) ON DELETE CASCADE
);
CREATE INDEX plant_name_idx ON plant USING btree (name);
CREATE INDEX plant_region_id_idx ON plant USING btree (region_id);

-- migrate:down
DROP INDEX IF EXISTS plant_name_idx;
DROP INDEX IF EXISTS plant_region_id_idx;
DROP TABLE plant;