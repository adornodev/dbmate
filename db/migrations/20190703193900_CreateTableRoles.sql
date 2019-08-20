-- migrate:up
create table authorization_roles (
    id uuid NOT NULL Primary Key,
    group_name VARCHAR(100),
    role_description VARCHAR(500),
    plant varchar(10) null,
    equipment_type varchar(100) null,
    general_role varchar(100) null
);

COMMENT ON COLUMN authorization_roles.id IS 'ID Do grupo no AD da Azure da Braskem';

-- migrate:down

COMMENT ON COLUMN authorization_roles.id IS NULL;
drop table if exists authorization_roles;
