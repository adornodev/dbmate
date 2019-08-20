-- migrate:up
CREATE TABLE batch_phase (
	id uuid NOT NULL,
	phase varchar(50) NULL,
	start_time timestamp NULL,
	end_time timestamp NULL,
	batch_id uuid NULL,
	CONSTRAINT batch_phase_pkey PRIMARY KEY (id),
	CONSTRAINT batch_phase_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES batch(id) ON DELETE CASCADE
);
CREATE INDEX batch_phase_batch_id_idx ON batch_phase USING btree (batch_id);


-- migrate:down
DROP INDEX IF EXISTS batch_phase_batch_id_idx;
DROP TABLE batch_phase;

