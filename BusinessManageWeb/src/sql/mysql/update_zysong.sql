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
VALUES('sys','productData','业务数据','/market/rule/productData','wb_2','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
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
VALUES ('MARKET', 'market_status', '1', '正在计算', '2', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_status', '2', '计算成功', '3', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_status', '3', '计算失败', '4', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_fileType', '', '未知', '0', 'admin', now(), 'admin', now(), '文件类型');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('MARKET', 'market_fileType', 'txt', 'txt', '1', 'admin', now(), 'admin', now(), '');
--resource
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_kMeansFilter','URL','KMeans结果过滤','/market/rule/kMeansFilter','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_kMeansInfo','URL','获取KMeans结果信息','/market/rule/kMeansInfo','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_filterMonitor','URL','监控KMeans过滤过程','/market/rule/monitor','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_getCentors','URL','获取kMeans中心点','/market/rule/getCenters','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_getSceneRowCol','URL','场景行列信息','/market/rule/getSceneRowCol','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_kMeansResult','URL','kMeans结果列表','/market/rule/kMeansResult','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_kMeansById','URL','kMeans结果详细','/market/rule/kMeansById','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_kMeansList','URL','获取kMeans结果列表','/market/rule/kMeansList','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_kMeansResultDel','URL','删除kMeans计算结果','/market/rule/kMeansResultDel','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_produceModel','URL','业务模型页面','/market/rule/produceModel','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_modelPredict','URL','模型计算','/market/rule/modelPredict','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_produceModelList','URL','获取业务模型菜单列表','/market/rule/produceModelList','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_fileList','URL','获取文件菜单列表','/market/rule/fileList','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_getProductData','URL','获取业务数据信息','/market/rule/getProductData','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_calcuMonitor','URL','监控计算进度信息','/market/rule/calcuMonitor','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_productData','URL','业务数据页面','/market/rule/productData','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_productDataList','URL','获取业务数据列表','/market/rule/productDataList','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_productDataAdd','URL','新增业务数据','/market/rule/productDataAdd','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_sceneList','URL','获取场景菜单列表','/market/rule/sceneList','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_resultList','URL','预测结果页面','/market/rule/resultList','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('market_rule_kMeansResultList','URL','kMeans结果列表详细','/market/rule/kMeansResultList','admin',now(),'admin',now(),'',NULL);

