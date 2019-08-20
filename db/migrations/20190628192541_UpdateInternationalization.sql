-- migrate:up

alter table internationalization
add column if not exists "language" varchar(50);

update internationalization
set "language" = case
					when lower(language_code) = 'en'    then 'English'
					when lower(language_code) = 'pt-br' then 'Português'
					end;
				
insert into internationalization("language", language_code, "version", "data")
values('Português', 'pt-br', 5, '
{
	"formatters": {
	  "currency": "R$",
	  "date": "dd/MM/yyyy",
	  "datetime": "dd/MM/yyyy HH:mm:ss",
	  "value": "#.####,##"
	},
	"labels": {
	"ui.menu_card.header_section.digital_predictive ": "Preditiva Digital",
	"ui.menu_card.main_section.compressor": "Compressor",
	"ui.menu_card.main_section.extruder": "Extrusora",
	"ui.menu_card.main_section.control_valve ": "Válvula",
	"ui.menu_card.main_section.centrifugal_pump ": "Bomba",
	"ui.menu_card.main_section.furnace": "Forno",
	"ui.menu_card.main_section.heat_exchanger": "Trocador de Calor",
	"ui.menu_card.icons.tooltip.compressor": "Compressor",
	"ui.menu_card.icons.tooltip.extruder": "Extrusora",
	"ui.menu_card.icons.tooltip.control_valve": "Válvula",
	"ui.menu_card.icons.tooltip.centrifugal_pump": "Bomba",
	"ui.menu_card.icons.tooltip.furnace": "Forno",
	"ui.menu_card.icons.tooltip.heat_exchanger": "Trocador de Calor",
	"ui.menu_card.main_section.title": "Menu da Aplicação",
	"ui.menu_card.footer_section.translate_button.tooltip": "Mudar idioma",
	"ui.menu_card.footer_section.tooltip.expand_menu": "Expandir Menu",
	"ui.menu_card.footer_section.tooltip.shrink_menu": "Retrair Menu",
	"ui.equipment_detail.equipment_detail_card.equipment_part_selector.title": "Parte do Equipamento",
	"ui.equipment_detail.alarm_card.title": "Alarme",
	"ui.equipment_detail.alarm_card.alarm_list.blank_state": "Nenhuma ocorrência de Alarme",
	"ui.equipment_detail.alarm_card.alarm_list.tooltip.failure_mode": "Modos de Falha",
	"ui.equipment_detail.alarm_card.alarm_list.tooltip.remark": "Comentário",
	"ui.equipment_detail.failure_mode_card.title": "Modos de Falha",
	"ui.equipment_detail.maintenance_history.title": "Histórico de Manutenção",
	"ui.equipment_detail.date_range_card.start": "Início",
	"ui.equipment_detail.date_range_card.end": "Fim",
	"ui.equipment_detail.alarm_popup_card.detail_section.instant": "Instante",
	"ui.equipment_detail.alarm_popup_card.detail_section.origin": "Origem",
	"ui.equipment_detail.alarm_popup_card.detail_section.severity": "Severidade",
	"ui.equipment_detail.alarm_popup_card.extra_section.failure_mode": "Modos de Falha",
	"ui.equipment_detail.alarm_popup_card.extra_section.similar_event": "Eventos Similares",
	"ui.equipment_detail.alarm_popup_card.extra_section.related_variable": "Variáveis Relacionadas",
	"ui.equipment_detail.alarm_popup_card.status_section.procedent": "Procedente",
	"ui.equipment_detail.alarm_popup_card.status_section.improcedent": "Improcedente",
	"ui.equipment_detail.alarm_popup_card.status_section.undetermined": "Indeterminado",
	"ui.equipment_detail.alarm_popup_card.status_section.acknowledge_alert": "Reconhecer Alerta",
	"ui.equipment_detail.alarm_popup_card.status_section.procedent_at": "Procedente em",
	"ui.equipment_detail.alarm_popup_card.status_section.unprocedent_at": "Improcedente em",
	"ui.equipment_detail.alarm_popup_card.status_section.undetermined_at": "Indeterminado em",
	"ui.equipment_detail.alarm_popup_card.status_section.acknowledged_at": "Reconhecido em",
	"ui.equipment_detail.alarm_popup_card.detail_section.severity.medium": "Média",
	"ui.equipment_detail.alarm_popup_card.detail_section.severity.high": "Alta",
	"ui.equipment_detail.alarm_popup_card.detail_section.severity.critical": "Alta",
	"ui.equipment_detail.alarm_popup_card.detail_section.severity.low": "Baixa",
	"ui.equipment_detail.alarm_popup_card.toast.change_ack_status.success": "Alarme reconhecido com sucesso!",
	"ui.equipment_detail.alarm_popup_card.toast.change_class_status.success": "Alarme classificado com sucesso!",
	"ui.equipment_detail.alarm_popup_card.trend.threshold_x.start": "Início da Ocorrência",
	"ui.equipment_detail.alarm_popup_card.trend.threshold_x.end": "Fim da Ocorrência"
	}
}'
)
on conflict on constraint internationalization_language_code_version_key do nothing;

insert into internationalization("language", language_code, "version", "data")
values('English', 'en', 6, '
{
	"formatters": {
	  "currency": "US$",
	  "date": "MM/dd/yyyy",
	  "datetime": "MM/dd/yyyy HH:mm:ss",
	  "value": "#,####.##"
	},
	"labels": {
		"ui.menu_card.header_section.digital_predictive ": "Digital Predictive",
		"ui.menu_card.main_section.compressor": "Compressor",
		"ui.menu_card.main_section.extruder": "Extruder",
		"ui.menu_card.main_section.control_valve": "Valve",
		"ui.menu_card.main_section.centrifugal_pump": "Pump",
		"ui.menu_card.main_section.furnace": "Furnace",
		"ui.menu_card.main_section.heat_exchanger": "Heat Exchanger",
		"ui.menu_card.icons.tooltip.compressor": "Compressor",
		"ui.menu_card.icons.tooltip.extruder": "Extruder",
		"ui.menu_card.icons.tooltip.control_valve": "Valve",
		"ui.menu_card.icons.tooltip.centrifugal_pump": "Pump",
		"ui.menu_card.icons.tooltip.furnace": "Furnace",
		"ui.menu_card.icons.tooltip.heat_exchanger": "Heat Exchanger",
		"ui.menu_card.main_section.title": "Application Menu",
		"ui.menu_card.footer_section.translate_button.tooltip": "Change language",
		"ui.menu_card.footer_section.translate_label": "Change language",
		"ui.menu_card.footer_section.tooltip.expand_menu": "Expand Menu",
		"ui.menu_card.footer_section.tooltip.shrink_menu": "Shrink Menu",
		"ui.equipment_detail.equipment_detail_card.equipment_part_selector.title": "Equipament Part",
		"ui.equipment_detail.alarm_card.title": "Alarm",
		"ui.equipment_detail.alarm_card.alarm_list.blank_state": "No Alarm occurrence",
		"ui.equipment_detail.alarm_card.alarm_list.tooltip.failure_mode": "Failure Modes",
		"ui.equipment_detail.alarm_card.alarm_list.tooltip.remark": "Remarks",
		"ui.equipment_detail.failure_mode_card.title": "Failure Modes",
		"ui.equipment_detail.maintenance_history.title": "Maintenance History",
		"ui.equipment_detail.date_range_card.start": "Start",
		"ui.equipment_detail.date_range_card.end": "End",
		"ui.equipment_detail.alarm_popup_card.detail_section.instant": "Timestamp",
		"ui.equipment_detail.alarm_popup_card.detail_section.origin": "Origin",
		"ui.equipment_detail.alarm_popup_card.detail_section.severity": "Severity",
		"ui.equipment_detail.alarm_popup_card.extra_section.failure_mode": "Failure Modes",
		"ui.equipment_detail.alarm_popup_card.extra_section.similar_event": "Similar Events",
		"ui.equipment_detail.alarm_popup_card.extra_section.related_variable": "Related Variables",
		"ui.equipment_detail.alarm_popup_card.status_section.procedent": "Procedent",
		"ui.equipment_detail.alarm_popup_card.status_section.improcedent": "Improcedent",
		"ui.equipment_detail.alarm_popup_card.status_section.undetermined": "Undetermined",
		"ui.equipment_detail.alarm_popup_card.status_section.acknowledge_alert": "Acknowledge Alert",
		"ui.equipment_detail.alarm_popup_card.status_section.procedent_at": "Procedent at",
		"ui.equipment_detail.alarm_popup_card.status_section.unprocedent_at": "Unprocedent at",
		"ui.equipment_detail.alarm_popup_card.status_section.undetermined_at": "Undetermined at",
		"ui.equipment_detail.alarm_popup_card.status_section.acknowledged_at": "Acknowledged at",
		"ui.equipment_detail.alarm_popup_card.detail_section.severity.medium": "Medium",
		"ui.equipment_detail.alarm_popup_card.detail_section.severity.high": "High",
		"ui.equipment_detail.alarm_popup_card.detail_section.severity.critical": "High",
		"ui.equipment_detail.alarm_popup_card.detail_section.severity.low": "Low",
		"ui.equipment_detail.alarm_popup_card.toast.change_ack_status.success": "Alarm acknowledge with success!",
		"ui.equipment_detail.alarm_popup_card.toast.change_class_status.success": "Alarm classified with success!",
		"ui.equipment_detail.alarm_popup_card.trend.threshold_x.start": "Start Occurrence",
		"ui.equipment_detail.alarm_popup_card.trend.threshold_x.end": "End Occurence"
	}
}'
) on conflict on constraint internationalization_language_code_version_key do nothing;

-- migrate:down

delete
from internationalization
where "version" = 5 and language_code = 'pt-br'

delete
from internationalization
where "version" = 6 and language_code = 'en'

ALTER TABLE internationalization 
DROP COLUMN "language";
