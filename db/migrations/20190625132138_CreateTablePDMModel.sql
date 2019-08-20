-- migrate:up
CREATE TABLE pdm_model (
	id uuid NOT NULL,
	contract json NULL,
	CONSTRAINT pdm_model_pkey PRIMARY KEY (id)
);

-- migrate:down
DROP TABLE pdm_model;
