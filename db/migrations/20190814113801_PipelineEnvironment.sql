-- migrate:up
CREATE TABLE IF NOT EXISTS public.pipeline_environment (
	id uuid NOT NULL,
	blob_storage_key varchar(2000) NOT NULL,
	blob_storage_account_name varchar(2000) NOT NULL,
	blob_storage_container varchar NOT NULL,
	service_bus_connection_string varchar(2000) NOT NULL,
	log_queue_name varchar NOT NULL
);

ALTER TABLE public.pdm_model DROP CONSTRAINT  IF EXISTS pdm_model_pipeline_environment_fk;

delete from public.pipeline_environment;
ALTER TABLE public.pipeline_environment DROP CONSTRAINT IF EXISTS pipeline_environment_pk;
ALTER TABLE public.pipeline_environment ADD CONSTRAINT pipeline_environment_pk PRIMARY KEY (id);


INSERT INTO pipeline_environment (id,blob_storage_key,blob_storage_account_name,blob_storage_container,service_bus_connection_string,log_queue_name) VALUES 
('935b6633-8986-420d-8c31-80f7511e5d7b','vyyi2NG9qVe59jmlVZm9ZsUFKqDZxd0meB9HGV4M6LFjhV3ONXmRUyTfHwHO+aEN4vbuOobdJY/j9GDAHGG/Mw==','stwcoepdmblob01dev','pipelinecache','Endpoint=sb://sbwcoepredictmaint01dev.servicebus.windows.net/;SharedAccessKeyName=Publisher;SharedAccessKey=SXZHrY2+mRryb4DG2c3r40lqpPatmoYiKu+YiKTqXfM=','model-execution-log') ON CONFLICT DO NOTHING ;


ALTER TABLE public.pdm_model add column if not exists pipeline_env_id uuid NOT null default '935b6633-8986-420d-8c31-80f7511e5d7b';

update public.pdm_model set pipeline_env_id = '935b6633-8986-420d-8c31-80f7511e5d7b';

ALTER TABLE public.pdm_model ADD CONSTRAINT pdm_model_pipeline_environment_fk FOREIGN KEY (pipeline_env_id) REFERENCES public.pipeline_environment(id);

-- migrate:down

