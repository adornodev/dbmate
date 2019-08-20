-- migrate:up
CREATE TABLE user_access_history (
	"time" timestamp NULL,
	user_id varchar(355) NOT NULL,
	"path" varchar(355) NOT NULL
);
-- migrate:down
DROP TABLE user_access_history;
