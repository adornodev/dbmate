-- migrate:up
CREATE OR REPLACE FUNCTION increment_internationalization_version()
RETURNS trigger
LANGUAGE plpgsql
AS
$$
DECLARE
  max_version int := 0;
begin
  SELECT MAX("version") + 1 INTO max_version FROM internationalization WHERE language_code = NEW.language_code;
  IF max_version is null THEN
    NEW."version" := 1;
  ELSE
    NEW."version" := max_version;
  END IF;
RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trigger_increment_internationalization_version on internationalization;

create trigger trigger_increment_internationalization_version
before insert on internationalization
for each row execute procedure increment_internationalization_version();


ALTER TABLE internationalization
ALTER COLUMN "version" drop not null;

ALTER TABLE internationalization
ALTER COLUMN "version" drop default;

-- migrate:down

DROP TRIGGER IF EXISTS trigger_increment_internationalization_version on internationalization;

DROP FUNCTION IF EXISTS increment_internationalization_version();


ALTER TABLE internationalization
ALTER COLUMN "version" set not null;

ALTER TABLE internationalization
ALTER COLUMN "version" set default 1;

