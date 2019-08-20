-- seed:up
insert into country(id, name) values(uuid_generate_v4(), 'pais novo')

-- seed:down
delete
from country
where name = 'pais novo'
