-- migrate:up
CREATE index if not exists tag_normalized_name_idx ON tag(upper("name"));

-- migrate:down
drop index if exists tag_normalized_name_idx;
