-- migrate:up
CREATE TABLE IF NOT EXISTS public.model_queue
(
	id uuid primary key,
	contract_id uuid not null,
	insertion_date timestamp not null,
	processing bool not null,
	model_input json not null,
	CONSTRAINT model_queue_pdm_model_fkey FOREIGN KEY (contract_id) REFERENCES pdm_model(id) ON DELETE CASCADE
);

-- migrate:down
drop table if exists public.model_queue;
