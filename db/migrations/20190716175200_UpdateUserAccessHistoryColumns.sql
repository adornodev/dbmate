-- migrate:up
ALTER table user_access_history
ADD COLUMN IF NOT exists "equipment_type" text,
ADD COLUMN IF NOT exists "plant" text,
ADD COLUMN IF NOT exists "equipment" text;

CREATE INDEX if not exists idx_user_access_history_user_id ON user_access_history(user_id);
CREATE INDEX if not exists idx_user_access_history_plant ON user_access_history(plant);
CREATE INDEX if not exists idx_user_access_history_equipment_type ON user_access_history(equipment_type);
CREATE INDEX if not exists idx_user_access_history_equipment ON user_access_history(equipment);

-- migrate:down
ALTER TABLE user_access_history
DROP COLUMN IF EXISTS "equipment_type",
DROP COLUMN IF EXISTS "plant",
DROP COLUMN IF EXISTS "equipment";

DROP INDEX if exists idx_user_access_history_user_id;
DROP INDEX if exists idx_user_access_history_plant;
DROP INDEX if exists idx_user_access_history_equipment_type;
DROP INDEX if exists idx_user_access_history_equipment;