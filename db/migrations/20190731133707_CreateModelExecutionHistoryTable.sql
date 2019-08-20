-- migrate:up
drop table if exists model_execution_history;
CREATE TABLE if not exists model_execution_history(
	id uuid primary key,
	insertion_date timestamp,
	contract_id uuid not null,
	"timestamp" timestamp not null,
	"log" json not null
);

CREATE INDEX IF NOT exists model_execution_history_contract_id_pk ON model_execution_history (contract_id);
CREATE INDEX IF NOT exists model_execution_history_timestamp_pk   ON model_execution_history(timestamp);

CREATE OR REPLACE FUNCTION set_fields_model_execution_history_on_insert()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
    BEGIN        
        NEW.insertion_date = now_utc();
        new.id             = uuid_generate_v4();
        NEW.contract_id    = new.log->>'ContractId';
        NEW."timestamp"    = cast((new.log->>'Timestamp') as timestamp);
        RETURN NEW;
    END;
$function$
;

DROP TRIGGER IF EXISTS auto_set_fields_model_execution_history_trigger on model_execution_history;DROP TRIGGER IF EXISTS auto_set_fields_model_execution_history_trigger on model_execution_history;
create trigger auto_set_fields_model_execution_history_trigger before insert on model_execution_history for each row execute procedure set_fields_model_execution_history_on_insert();

-- migrate:down
drop table if exists model_execution_history;

drop index if exists model_execution_history_pk;
drop index if exists model_execution_history_timestamp_pk;


drop function if exists set_fields_model_execution_history_on_insert;

DROP TRIGGER IF EXISTS auto_set_fields_model_execution_history_trigger on model_execution_history;

