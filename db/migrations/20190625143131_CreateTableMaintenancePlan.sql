-- migrate:up
CREATE TABLE maintenance_plan (
	id uuid NOT NULL,
	description varchar(50) NULL,
	frequency float8 NULL,
	plan_id varchar(50) NULL,
	equipment_id uuid NULL,
	CONSTRAINT maintenance_plan_pkey PRIMARY KEY (id),
	CONSTRAINT maintenance_plan_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE
);
CREATE INDEX maintenance_plan_equipment_id_idx ON maintenance_plan USING btree (equipment_id);
CREATE INDEX maintenance_plan_plan_id_idx ON maintenance_plan USING btree (plan_id);

-- migrate:down
DROP INDEX IF EXISTS maintenance_plan_equipment_id_idx;
DROP INDEX IF EXISTS maintenance_plan_plan_id_idx;
DROP TABLE maintenance_plan;