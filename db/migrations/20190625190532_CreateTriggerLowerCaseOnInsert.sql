-- migrate:up
DROP TRIGGER IF EXISTS lowercase_on_insert_trigger on process_configurations;
CREATE TRIGGER lowercase_on_insert_trigger BEFORE INSERT OR UPDATE ON process_configurations
    FOR EACH ROW EXECUTE PROCEDURE lowercase_on_insert();

-- migrate:down
DROP TRIGGER IF EXISTS lowercase_on_insert_trigger on process_configurations;
