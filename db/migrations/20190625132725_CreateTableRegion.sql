-- migrate:up
CREATE TABLE region (
	id uuid NOT NULL,
	"name" varchar(50) NULL,
	country_id uuid NULL,
	CONSTRAINT region_pkey PRIMARY KEY (id),
	CONSTRAINT region_country_id_fkey FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE CASCADE
);
CREATE INDEX region_country_id_idx ON region USING btree (country_id);
CREATE INDEX region_name_idx ON region USING btree (name);

-- migrate:down
DROP INDEX IF EXISTS region_country_id_idx;
DROP INDEX IF EXISTS region_name_idx;
DROP TABLE region;