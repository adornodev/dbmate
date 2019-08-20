-- migrate:up
CREATE TABLE scheduled_stop (
	id uuid NOT NULL,
	sub_area_id uuid NULL,
	start_date timestamp NULL,
	start_remarks text NULL,
	start_remarks_user varchar(50) NULL,
	end_date timestamp NULL,
	end_remarks text NULL,
	end_remarks_user varchar(50) NULL,
	CONSTRAINT scheduled_stop_pkey PRIMARY KEY (id),
	CONSTRAINT scheduled_stop_sub_area_id_fkey FOREIGN KEY (sub_area_id) REFERENCES sub_area(id) ON DELETE CASCADE
);
CREATE INDEX scheduled_stop_sub_area_id_idx ON scheduled_stop USING btree (sub_area_id);

-- migrate:down
DROP INDEX IF EXISTS scheduled_stop_sub_area_id_idx;
DROP TABLE scheduled_stop;
