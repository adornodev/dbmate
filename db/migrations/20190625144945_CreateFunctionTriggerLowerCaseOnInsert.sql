-- migrate:up
CREATE OR REPLACE FUNCTION lowercase_on_insert()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
    BEGIN        
        NEW.process_name = lower(NEW.process_name);
        NEW."key" 		 = lower(NEW."key");
        RETURN NEW;
    END;
$function$

-- migrate:down
DROP FUNCTION IF EXISTS lowercase_on_insert();
