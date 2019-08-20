-- migrate:up
CREATE table if not exists extruder_first_event (
	"key" int4 NOT NULL,
	value varchar(255) NOT NULL
);

-- migrate:down
DROP table if EXISTS public.extruder_first_event;
