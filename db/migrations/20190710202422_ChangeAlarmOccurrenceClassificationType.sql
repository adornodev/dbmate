-- migrate:up
update alarm_occurrence
set class_type = case 
					when lower(class_type) = 'procedente' then 'procedent'
					when lower(class_type) = 'improcedente' then 'unfounded'
					when lower(class_type) = 'indeterminado' then 'undetermined'						
					else class_type
					end

-- migrate:down
update alarm_occurrence
set class_type = case 
					when lower(class_type) = 'procedent' then 'procedente'
					when lower(class_type) = 'unfounded' then 'improcedente'
					when lower(class_type) = 'undetermined' then 'indeterminado'						
					else class_type
					end
