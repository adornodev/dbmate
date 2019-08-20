-- migrate:up
CREATE TABLE user_permission (
	user_email varchar(355) NOT NULL,
	plant_id varchar(10) NOT NULL
);

-- migrate:down
DROP TABLE user_permission;
