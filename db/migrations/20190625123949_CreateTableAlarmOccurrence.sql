-- migrate:up
CREATE TABLE alarm_occurrence (
	id uuid NOT NULL,
	alarm_id uuid NULL,
	in_timestamp timestamp NULL,
	ack_timestamp timestamp NULL,
	out_timestamp timestamp NULL,
	class_timestamp timestamp NULL,
	ack_user varchar(50) NULL,
	ack_remarks varchar(2000) NULL,
	class_user varchar(50) NULL,
	class_remarks varchar(2000) NULL,
	failure_modes json NULL,
	class_type varchar(50) NULL,
	CONSTRAINT alarm_occurrence_pkey PRIMARY KEY (id),
	CONSTRAINT alarm_occurrence_un UNIQUE (alarm_id, in_timestamp)
);

-- migrate:down

DROP TABLE alarm_occurrence;