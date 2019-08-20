-- migrate:up
CREATE TABLE received_files (
	in_timestamp timestamp NULL,
	plant varchar(10) NULL,
	file varchar(50) NULL
);

-- migrate:down
DROP TABLE received_files;
