-- migrate:up

insert into authorization_roles (id,plant,equipment_type,general_role,group_name,role_description) values 
('cb6b7cec-550c-4099-9d21-1811d8997a14' ,'Q2',null,null,'GG-BRA-BSKPdM_Plant_Q2',	'Usuários com permissão de visualizar as informações da referentes a Q2')
,('d9b9cc6b-3739-4930-ae6a-7d79ded9b29c','PP1',null,null,'GG-BRA-BSKPdM_Plant_PP1',	'Usuários com permissão de visualizar as informações da referentes a PP1')
,('1bb66718-2db2-4a5d-ba07-6fb100e44c1c','PP2',null,null,'GG-BRA-BSKPdM_Plant_PP2',	'Usuários com permissão de visualizar as informações da referentes a PP2')
,('7b3bddcf-3b9b-467e-bdaa-5613c0d0c98c','PE4',null,null,'GG-BRA-BSKPdM_Plant_PE4',	'Usuários com permissão de visualizar as informações da referentes a PE4')
,('11151b4e-cda0-487d-a785-cdd045150274','PE5',null,null,'GG-BRA-BSKPdM_Plant_PE5',	'Usuários com permissão de visualizar as informações da referentes a PE5')
,('8115e448-b3e6-4443-8dcc-5fa38f64248e','PE6',null,null,'GG-BRA-BSKPdM_Plant_PE6',	'Usuários com permissão de visualizar as informações da referentes a PE6')
,('86be48cb-9ba2-4873-a040-ee7bce5fa64e','PVC2',null,null,'GG-BRA-BSKPdM_Plant_PVC2',	'Usuários com permissão de visualizar as informações da referentes a PVC2')
,('0852d416-ed3c-4559-a4fd-1069d31dd8a9','PP4',null,null,'GG-BRA-BSKPdM_Plant_PP4',	'Usuários com permissão de visualizar as informações da referentes a PP4')
,('3ab09604-3407-44ad-a4e0-1686ce934873',null,'ControlValve',null,'GG-BRA-BSKPdM_EqpFamily_ControlValve','Usuários com permissão de visualizar as informações da referentes à família de equipamentos de válvulas de controle')
,('195dd7a9-94a3-43dd-8e55-3f798926a31b',null,'Pump',null,'GG-BRA-BSKPdM_EqpFamily_Pump','Usuários com permissão de visualizar as informações da referentes à família de equipamentos de bombas')
,('f289a7b4-e51a-4831-b9da-148d77d00974',null,'HeatExchanger',null,'GG-BRA-BSKPdM_EqpFamily_HeatExchanger','Usuários com permissão de visualizar as informações da referentes à família de equipamentos de trocadores de calor')
,('862fd872-7bf0-4398-8317-31831819fd75',null,'Furnace',null,'GG-BRA-BSKPdM_EqpFamily_Furnace','Usuários com permissão de visualizar as informações da referentes à família de equipamentos de válvulas de fornos')
,('6de9449b-53c1-4b52-89be-22aef826012a',null,'Extruder',null,'GG-BRA-BSKPdM_EqpFamily_Extruder','Usuários com permissão de visualizar as informações da referentes à família de equipamentos de extrusoras')
,('61b7c4a4-5627-494e-876d-d734f4049d9c',null,'Compressor',null,'GG-BRA-BSKPdM_EqpFamily_Compressor','Usuários com permissão de visualizar as informações da referentes à família de equipamentos de compressores')
,('1e7be666-0e43-4a85-8f08-02d0e6d53dab',null,'ReactionSystem',null,'GG-BRA-BSKPdM_EqpFamily_ReactionSystem','Usuários com permissão de visualizar as informações da referentes à família de equipamentos de sistemas de reação')
,('dcce178c-2bcd-4afe-8179-eff9db5ccfd6',null,null,'User','GG-BRA-BSKPdM_UserRole_User','Usuários com papel de visualização')
,('237c7969-ce03-4946-9290-b0b49c3cebd6',null,null,'EqpAdmin','GG-BRA-BSKPdM_UserRole_EqpAdmin','Usuários com papel de administração de equipamentos')
,('1f259fd9-20fe-4775-9168-d1b94d8ea6b6',null,null,'ProjectAdmin','GG-BRA-BSKPdM_UserRole_ProjectAdmin','Usuários com papel de administração da plataforma') on conflict do nothing;
-- migrate:down
delete from authorization_roles;
