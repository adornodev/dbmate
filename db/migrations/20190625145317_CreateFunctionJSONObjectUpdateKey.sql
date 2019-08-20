-- migrate:up
CREATE OR REPLACE FUNCTION json_object_update_key(json json, key_to_set text, value_to_set anyelement)
 RETURNS json
 LANGUAGE sql
 IMMUTABLE STRICT
AS $function$
SELECT CASE
  WHEN ("json" -> "key_to_set") IS NULL THEN "json"
  ELSE (SELECT concat('{', string_agg(to_json("key") || ':' || "value", ','), '}')
          FROM (SELECT *
                  FROM json_each("json")
                 WHERE "key" <> "key_to_set"
                 UNION ALL
                SELECT "key_to_set", to_json("value_to_set")) AS "fields")::json
END
$function$
;

-- migrate:down
DROP FUNCTION IF EXISTS json_object_update_key(json,text,anyelement);
