INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','wb_1','慧脑智库','','market','1','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','scene','场景配置','/market/wbWarehouse/scene','wb_1','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','condition','条件配置','/market/wbWarehouse/condition','wb_1','2','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','strategy','策略配置','/market/wbWarehouse/strategy','wb_1','3','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);

INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','wb_2','慧脑决策','','market','3','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','dataUpload','业务数据','/market/rule/productData','wb_2','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','reasonAnalysis','因素分析','/market/rule/modelAnalysis','wb_2','2','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','produceModel','业务模型','/market/rule/produceModel','wb_2','3','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','resultList','预测结果','/market/rule/resultList','wb_2','4','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);

INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_modelType', '', '未知', '0', 'admin', now(), 'admin', now(), '模型类型');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_modelType', '0', '随机森林模型', '1', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_modelType', '1', '推荐模型', '2', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_modelType', '2', '分类模型', '3', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_modelType', '3', '决策树模型', '4', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_modelType', '4', 'GBDT模型', '5', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_modelType', '5', '逻辑回归模型', '6', 'admin', now(), 'admin', now(), '');

INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('SYS', 'sys_model_context', '/market', '/wb-market', '5', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('SYS', 'sys_model', 'MARKET', '营销策略库', '5', 'admin', now(), 'admin', now(), '智能营销业务系统');

INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_status', '', '未知', '0', 'admin', now(), 'admin', now(), '条件类型');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_status', '0', '未处理', '1', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_status', '1', '正在训练', '2', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_status', '2', '训练成功', '3', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_status', '3', '训练失败', '4', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_fileType', '', '未知', '0', 'admin', now(), 'admin', now(), '文件类型');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_fileType', 'txt', 'txt', '1', 'admin', now(), 'admin', now(), '');
