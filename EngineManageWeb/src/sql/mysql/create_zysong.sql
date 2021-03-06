CREATE USER wisdombrain IDENTIFIED BY 'wisdombrain';
GRANT ALL PRIVILEGES ON *.* TO 'wisdombrain'@'%' IDENTIFIED BY 'wisdombrain' WITH GRANT OPTION;
FLUSH PRIVILEGES;

--sys_menu
INSERT INTO `wb`.`sys_menu` (`MENU_ID`,`NODE_ID`,`NODE_NAME`,`NODE_URL`,`PARENT_NODE`,`SEQ_ID`,`NODE_IMG`,`RELA_FLAG`,`NODE_TARGET`,`NODE_CMD`,`NODE_VISIBLE`,`NODE_TOOLTIP`,`HAS_CHILD_FLAG`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('sys', 'em', '引擎管理', '/em', 'sysroot', '2', 'linecons-search', '1', null, null, '1', null, '1', null, null, null, null, null);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','em_2','随机森林引擎','','em','2','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','trainData','训练数据','/em/rule/trainData','em_2','3','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','modelAnalysis','模型分析','/em/rule/modelAnalysis','em_2','4','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','em_3','推荐引擎','','em','3','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','recomTrain','训练数据','/em/recommend/trainData','em_3','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','recomAnalysis','模型分析','/em/recommend/modelAnalysis','em_3','2','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','em_4','分类引擎','','em','4','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','classificTrain','训练数据','/em/classification/trainData','em_4','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','classificAnalysis','模型分析','/em/classification/modelAnalysis','em_4','2','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','em_5','决策树引擎','','em','5','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','decisionTrain','训练数据','/em/decisionTree/trainData','em_5','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','decisionAnalysis','模型分析','/em/decisionTree/modelAnalysis','em_5','2','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','em_6','GBDT引擎','','em','6','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','GBDTTrain','训练数据','/em/GBDT/trainData','em_6','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','GBDTAnalysis','模型分析','/em/GBDT/modelAnalysis','em_6','2','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','em_7','逻辑回归引擎','','em','7','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','lrTrain','训练数据','/em/logisticRegression/trainData','em_7','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','lrAnalysis','模型分析','/em/logisticRegression/modelAnalysis','em_7','2','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','em_8','K均值聚类引擎','','em','8','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','kMeansTrain','训练数据','/em/kMeans/trainData','em_8','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','kMeansAnalysis','模型分析','/em/kMeans/modelAnalysis','em_8','2','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','em_9','高斯混合引擎','','em','9','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','GMTrain','训练数据','/em/GM/trainData','em_9','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','GMAnalysis','模型分析','/em/GM/modelAnalysis','em_9','2','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','em_10','二分均值引擎','','em','10','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','bisectingTrain','训练数据','/em/bisecting/trainData','em_10','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','bisectingAnalysis','模型分析','/em/bisecting/modelAnalysis','em_10','2','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','em_11','FPGrowth引擎','','em','11','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','FPGrowthTrain','训练数据','/em/FPGrowth/trainData','em_11','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','FPGrowthAnalysis','模型分析','/em/FPGrowth/modelAnalysis','em_11','2','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','em_1','慧脑智库','','em','1','linecons-cloud','1',NULL,NULL,'1',NULL,'1',NULL,now(),NULL,now(),NULL);
INSERT INTO `wb`.`sys_menu` (`MENU_ID`, `NODE_ID`, `NODE_NAME`, `NODE_URL`, `PARENT_NODE`, `SEQ_ID`, `NODE_IMG`, `RELA_FLAG`, `NODE_TARGET`, `NODE_CMD`, `NODE_VISIBLE`, `NODE_TOOLTIP`, `HAS_CHILD_FLAG`, `CRT_USER`, `CRT_TIME`, `UPD_USER`, `UPD_TIME`, `EXT`)
VALUES('sys','scene','场景配置','/em/wbWarehouse/scene','em_1','1','linecons-lightbulb','1',NULL,NULL,'1',NULL,NULL,NULL,now(),NULL,now(),NULL);

--sys_enums
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('EM', 'em_condType', '', '未知', '0', 'admin', now(), 'admin', now(), '条件类型');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('EM', 'em_condType', '0', '离散值', '1', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('EM', 'em_condType', '1', '连续值', '2', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('EM', 'em_fileType', '', '未知', '0', 'admin', now(), 'admin', now(), '文件类型');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('EM', 'em_fileType', 'txt', 'txt', '1', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('SYS', 'sys_model_context', '/em', '/wb-enginemanage', '4', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('SYS', 'sys_model', 'EM', '引擎管理', '20', 'admin', now(), 'admin', now(), '智能引擎管理系统');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('EM', 'em_status', '', '未知', '0', 'admin', now(), 'admin', now(), '状态类型');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('EM', 'em_status', '0', '未处理', '1', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('EM', 'em_status', '1', '正在训练', '2', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('EM', 'em_status', '2', '训练成功', '3', 'admin', now(), 'admin', now(), '');
INSERT INTO `wb`.`sys_enums` (`sys_code`,`enum_type`,`enum_id`,`enum_value`,`seq_id`,`crt_user`,`crt_time`,`upd_user`,`UPD_TIME`,`enum_desc`)
VALUES ('EM', 'em_status', '3', '训练失败', '4', 'admin', now(), 'admin', now(), '');

--sys_params
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('SCENE_UPLOAD_PATH', 'EM', 'hdfs://CDH1:9000/datafiles/ml/upload/rowCol/', '场景对应文件格式行列名称HDFS上传路径', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('TRAIN_UPLOAD_PATH', 'EM', 'hdfs://CDH1:9000/datafiles/ml/upload/train/', '训练数据HDFS上传路径', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('TRAIN_PREDICT_PATH', 'EM', 'hdfs://CDH1:9000/datafiles/ml/predict/train/', '训练模型预测结果HDFS路径', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('TRAIN_MODEL_PATH', 'EM', 'hdfs://CDH1:9000/datafiles/ml/model/train/', '训练模型HDFS路径', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('PRODUCE_UPLOAD_PATH', 'EM', 'hdfs://CDH1:9000/datafiles/ml/upload/produce/', '生产数据HDFS上传路径', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('PRODUCE_PREDICT_PATH', 'EM', 'hdfs://CDH1:9000/datafiles/ml/predict/produce/', '生产模型预测结果HDFS路径', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('PRODUCE_MODEL_PATH', 'EM', 'hdfs://CDH1:9000/datafiles/ml/model/produce/', '生产模型HDFS路径', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('SQL_FILTER_PATH', 'EM', 'hdfs://CDH1:9000/datafiles/sql/filter/', 'sparkSQL数据清洗过滤结果路径', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('SPARK_CLIENT_USER', 'EM', 'hadoop', '运行慧脑引擎的登陆用户', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('SPARK_CLIENT_HOST', 'EM', 'CDH1', '运行慧脑引擎的主机域名或IP', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('SPARK_SSH_PUBKEY', 'EM', 'C:/Users/ASUS/.ssh/id_rsa', '免密登陆证书地址', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('WB_ROOT_PATH', 'EM', '/home/hadoop/WisdomBrainEngine/', '慧脑引擎根目录绝对路径', 'admin', now(), null, null, null);
INSERT INTO `wb`.`sys_params` (`PARA_ID`,`PARA_RANK`,`PARA_VALUE`,`REMARK`,`CRT_USER`,`CRT_TIME`,`UPD_USER`,`UPD_TIME`,`EXT`)
VALUES ('WB_SPARK_HOME', 'EM', '/usr/spark-2.2.0/', '慧脑引擎spark家目录', 'admin', now(), null, null, null);

insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_sys_denied','URL','权限不足','/em/sys/denied','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_modelAnalysis','URL','kMeans模型分析页面','/em/kMeans/modelAnalysis','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_getLineData','URL','获取欧式距离数据','/em/kMeans/getLineData','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_modelApply','URL','模型应用','/em/kMeans/modelApply','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_getSelectData','URL','获取选中模型相关指标数据','/em/kMeans/getSelectData','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_sceneFileInfo','URL','获取文件、场景相关信息','/em/kMeans/sceneFileInfo','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_resultInfo','URL','获取训练结果相关信息','/em/kMeans/resultInfo','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_applyMonitor','URL','监控模型应用进度信息','/em/kMeans/applyMonitor','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_modelNoList','URL','获取模型编号菜单列表','/em/kMeans/modelNoList','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_trainData','URL','kMeans训练数据页面','/em/kMeans/trainData','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_modelById','URL','根据训练数据ID跳转到指定训练结果指标页面','/em/kMeans/modelById','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_modelByKMeansId','URL','根据训练结果ID跳转到指定训练结果指标页面','/em/kMeans/modelByKMeansId','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_trainDataList','URL','获取KMeans训练数据列表','/em/kMeans/trainDataList','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_train','URL','训练KMeans模型','/em/kMeans/train','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_trainDataAdd','URL','新增KMeans训练数据','/em/kMeans/trainDataAdd','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_downTrainFile','URL','下载KMeans模板数据文件','/em/kMeans/downTrainFile','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_sceneList','URL','获取场景列表','/em/kMeans/sceneList','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_kMeans_trainMonitor','URL','监控KMeans训练进度','/em/kMeans/trainMonitor','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_wbWarehouse_scene','URL','场景配置页面','/em/wbWarehouse/scene','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_wbWarehouse_sceneList','URL','获取场景列表','/em/wbWarehouse/sceneList','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_wbWarehouse_sceneEdit','URL','编辑场景','/em/wbWarehouse/sceneEdit','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_wbWarehouse_sceneAdd','URL','新增场景','/em/wbWarehouse/sceneAdd','admin',now(),'admin',now(),'',NULL);
insert into `wb`.`sys_resource` (`res_code`, `res_type`, `res_name`, `res_value`, `crt_user`, `CRT_TIME`, `upd_user`, `UPD_TIME`, `res_desc`, `res_tnode`)
values('em_wbWarehouse_downTrainFile','URL','下载行列模板文件','/em/wbWarehouse/downTrainFile','admin',now(),'admin',now(),'',NULL);
