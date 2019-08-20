-- migrate:up
CREATE TABLE process_configurations (
	process_name varchar(100) NOT NULL,
	"key" text NOT NULL,
	value text NULL
);
CREATE UNIQUE INDEX process_configurations_idx ON process_configurations USING btree (process_name, key);

-- migrate:down
DROP INDEX IF EXISTS process_configurations_idx;
DROP TABLE process_configurations;
