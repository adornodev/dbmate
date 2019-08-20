-- migrate:up
CREATE TABLE batch (
	id uuid NOT NULL,
	start_time timestamp NULL,
	pend_time timestamp NULL,
	end_time timestamp NULL,
	reactor varchar(50) NULL,
	resin varchar(50) NULL,
	sequential int4 NULL,
	recipe int4 NULL,
	plant_id uuid NULL,
	CONSTRAINT batch_pkey PRIMARY KEY (id),
	CONSTRAINT batch_plant_fk FOREIGN KEY (plant_id) REFERENCES plant(id)
);
CREATE INDEX batch_reactor_idx ON batch USING btree (reactor);
CREATE INDEX batch_sequential_idx ON batch USING btree (sequential);

-- migrate:down
DROP TABLE batch;
