-- migrate:up
CREATE TABLE IF NOT EXISTS model_execution_history (
	"log" json not null
);

CREATE UNIQUE INDEX IF NOT exists model_execution_history_pk ON model_execution_history (("log"->>'model_name'), ("log"->>'timestamp'))

-- migrate:down
DROP TABLE if exists model_execution_history;
drop index if exists model_execution_history_pk;
