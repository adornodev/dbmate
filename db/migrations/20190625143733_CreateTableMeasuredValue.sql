-- migrate:up
CREATE TABLE measured_value (
	tag_id uuid NOT NULL,
	"timestamp" timestamp NOT NULL,
	value float8 NULL,
	quality varchar(5) NULL,
	insertion_date timestamp NULL,
	value_str varchar(50) NULL,
	CONSTRAINT measured_value_pkey PRIMARY KEY (tag_id, "timestamp"),
	CONSTRAINT measured_value_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id) ON DELETE CASCADE
);
CREATE INDEX measured_value_tag_id_idx ON measured_value USING btree (tag_id);
CREATE INDEX measured_value_timestamp_idx ON measured_value USING btree ("timestamp" DESC);

-- migrate:down
DROP INDEX IF EXISTS measured_value_tag_id_idx;
DROP INDEX IF EXISTS measured_value_timestamp_idx;
DROP TABLE measured_value;
