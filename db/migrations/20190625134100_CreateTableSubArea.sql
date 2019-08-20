-- migrate:up
CREATE TABLE sub_area (
	id uuid NOT NULL,
	"name" varchar(50) NULL,
	area_id uuid NULL,
	CONSTRAINT sub_area_pkey PRIMARY KEY (id),
	CONSTRAINT sub_area_area_id_fkey FOREIGN KEY (area_id) REFERENCES area(id) ON DELETE CASCADE
);
CREATE INDEX sub_area_area_id_idx ON sub_area USING btree (area_id);

-- migrate:down
DROP TABLE sub_area;