-- migrate:up
CREATE TABLE country (
	id uuid NOT NULL,
	"name" varchar(50) NULL,
	CONSTRAINT country_name_key UNIQUE (name),
	CONSTRAINT country_pkey PRIMARY KEY (id)
);
CREATE INDEX country_name_idx ON country USING hash (name);

-- migrate:down
DROP TABLE country;
ALTER TABLE DROP INDEX country_name_idx;
