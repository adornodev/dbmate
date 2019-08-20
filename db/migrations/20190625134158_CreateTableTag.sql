-- migrate:up
CREATE TABLE tag (
	plant_id uuid NULL,
	id uuid NOT NULL,
	"name" varchar(50) NULL,
	unit_of_measure varchar(10) NULL,
	low_low_limit float8 NULL,
	low_limit float8 NULL,
	high_limit float8 NULL,
	high_high_limit float8 NULL,
	description varchar(50) NULL,
	CONSTRAINT tag_pkey PRIMARY KEY (id),
	CONSTRAINT unique_tag_name UNIQUE (name, plant_id),
	CONSTRAINT tag_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES plant(id) ON DELETE CASCADE
);
CREATE INDEX tag_plant_id_idx ON tag USING btree (plant_id);


-- migrate:down
DROP INDEX IF EXISTS tag_plant_id_idx;
DROP TABLE tag;
