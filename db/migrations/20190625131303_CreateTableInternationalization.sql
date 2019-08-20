-- migrate:up
CREATE TABLE internationalization (
	language_code varchar(10) NOT NULL,
	"data" json NOT NULL,
	"version" int4 NOT NULL DEFAULT 1,
	CONSTRAINT internationalization_language_code_version_key UNIQUE (language_code, version)
);
CREATE INDEX idx_language_code ON internationalization USING hash (language_code);

-- migrate:down
DROP INDEX IF EXISTS idx_language_code; 
DROP TABLE internationalization;