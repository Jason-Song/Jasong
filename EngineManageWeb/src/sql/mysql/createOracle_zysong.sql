#*************************************************
#KMeans中心点坐标记录表
#*************************************************
CREATE TABLE IF NOT EXISTS `t_kmeans_centers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `KMEANS_ID` int(11) DEFAULT '0' COMMENT 'KMeans训练结果ID',
  `CLUSTER_ID` varchar(100) DEFAULT '' COMMENT '簇序号',
  `CENTER` varchar(1000) DEFAULT '' COMMENT '中心点坐标',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KMeans中心点坐标记录表'
#*************************************************
#KMeans训练结果表
#*************************************************
CREATE TABLE IF NOT EXISTS `t_kmeans_index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `FILE_ID` int(11) DEFAULT '0' COMMENT '训练文件ID',
  `TRAIN_RES` varchar(1000) DEFAULT '' COMMENT '结果文件集存储路径',
  `WSSSE` varchar(1000) DEFAULT '' COMMENT '聚类总体方差',
  `CENTERS` int(11) DEFAULT '0' COMMENT '聚类中心点ID',
  `PERFORMANCE` varchar(1000) DEFAULT '' COMMENT '性能度量',
  `DISTANCE_MEAN` varchar(1000) DEFAULT '' COMMENT '平均中心距离',
  `TRAIN_MODEL` varchar(1000) DEFAULT '' COMMENT '训练模型位置',
  `MODEL_ARGS` varchar(1000) DEFAULT '' COMMENT '模型参数',
  `SCENE` int(11) DEFAULT '' COMMENT '场景ID',
  `CREATE_APP` varchar(1000) DEFAULT '' COMMENT '创建应用',
  `CREATE_USER` varchar(10) DEFAULT '' COMMENT '创建用户',
  `CREATE_TIME` char(26) DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KMeans训练结果表'
#*************************************************
#模型训练结果表
#*************************************************
CREATE TABLE IF NOT EXISTS `t_predict_index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `FILE_ID` int(11) NOT NULL,
  `TRAIN_RES` varchar(1000) DEFAULT '',
  `ACCURACY` varchar(1000) DEFAULT '',
  `TRAIN_NO` int(11) DEFAULT '0',
  `TEST_NO` int(11) DEFAULT '0',
  `PERFORMANCE` varchar(1000) DEFAULT '',
  `CLASS_NO` int(11) DEFAULT '0',
  `MATRIX` varchar(1000) DEFAULT '',
  `TRAIN_MODEL` varchar(1000) DEFAULT '',
  `MODEL_ARGS` varchar(1000) DEFAULT '',
  `MODEL_TREE` varchar(1000) DEFAULT '',
  `SCENE` int(11) NOT NULL,
  `CREATE_APP` varchar(1000) DEFAULT '',
  `CREATE_USER` varchar(10) DEFAULT '',
  `CREATE_TIME` char(26) DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `T_PREDICT_INDEX_UNIQUE_PK` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
#*************************************************
#HDFS上传训练数据文件记录表
#*************************************************
CREATE TABLE IF NOT EXISTS `t_train_data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `FILE_NAME` varchar(1000) DEFAULT '' COMMENT '文件ID',
  `HDFS_NAME` varchar(1000) DEFAULT '' COMMENT '上传文件名',
  `FILE_TYPE` varchar(10) DEFAULT '' COMMENT '文件类型',
  `FILE_SIZE` varchar(1000) DEFAULT '' COMMENT '文件大小',
  `FILE_DESC` varchar(1000) DEFAULT '' COMMENT '文件描述',
  `SCENE` int(11) NOT NULL COMMENT '场景',
  `MODEL` int(11) NOT NULL COMMENT '训练数据对应模型',
  `STATUS` int(11) DEFAULT '0' NOT NULL COMMENT '训练状态，0-未处理，1-正在训练，2-训练成功，3-训练失败',
  `EXTRA` varchar(1000) DEFAULT '' COMMENT '扩展字段',
  `UNIT` varchar(50) DEFAULT '' COMMENT '部门',
  `UPLOAD_USER` char(26) DEFAULT '' COMMENT '上传用户',
  `UPLOAD_TIME` char(26) DEFAULT '' COMMENT '上传时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HDFS上传训练数据文件记录表'
#*************************************************
#场景配置表
#*************************************************
CREATE TABLE IF NOT EXISTS `T_SCENE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '场景ID',
  `NAME` varchar(500) DEFAULT '' COMMENT '场景名',
  `SCENE_DESC` varchar(1000) DEFAULT '' COMMENT '场景描述',
  `SHORT_ROW` varchar(1000) DEFAULT '' COMMENT '短行号',
  `COND_NAME` varchar(1000) DEFAULT '' COMMENT '短数据维度名',
  `STRATEGY_NAME` varchar(1000) DEFAULT '' COMMENT '策略名',
  `ROW_NAME` varchar(1000) DEFAULT '' COMMENT '唯一标识行号HDFS路径',
  `COLUMN_NAME` varchar(1000) DEFAULT '' COMMENT '数据维度HDFS路径',
  `CREATE_USER` char(26) DEFAULT '' COMMENT '创建人',
  `CREATE_TIME` char(26) DEFAULT '' COMMENT '创建时间',
  `LAST_UPD_USER` char(26) DEFAULT '' COMMENT '最后编辑人',
  `LAST_UPD_TIME` char(26) DEFAULT '' COMMENT '最后编辑时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场景配置表'
#*************************************************
#K均值算法结果筛选表
#*************************************************
CREATE TABLE IF NOT EXISTS `T_KMEANS_FILTER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `RESULT_ID` int(11) NOT NULL COMMENT 'K均值结果ID',
  `FILTER_RES` varchar(1000) DEFAULT '' COMMENT '过滤结果位置',
  `CLUSTER_NO` varchar(1000) DEFAULT '' COMMENT '频度规则文件位置',
  `PERFORMANCE` varchar(1000) DEFAULT '' COMMENT '性能度量',
  `FILTER_ARGS` varchar(1000) DEFAULT '' COMMENT '输入参数',
  `SCENE` int(11) NOT NULL COMMENT '场景ID',
  `CREATE_APP` varchar(1000) DEFAULT '' COMMENT '创建应用',
  `CREATE_USER` char(26) DEFAULT '' COMMENT '创建用户',
  `CREATE_TIME` char(26) DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='K均值算法结果筛选表'
#*************************************************
#KMeans生产结果表
#*************************************************
CREATE TABLE IF NOT EXISTS `T_KMEANS_RESULT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `FILE_ID` int(11) NOT NULL COMMENT '生产数据文件ID',
  `PREDICT_ID` int(11) NOT NULL COMMENT '生产模型对应指标ID',
  `TRAIN_RES` varchar(1000) DEFAULT '' COMMENT '结果文件集存储路径',
  `WSSSE` varchar(1000) DEFAULT '' COMMENT '聚类总体方差',
  `DISTANCE_MEAN` varchar(1000) DEFAULT '' COMMENT '平均中心距离',
  `PERFORMANCE` varchar(1000) DEFAULT '' COMMENT '性能度量',
  `MODEL_ARGS` varchar(1000) DEFAULT '' COMMENT '输入参数',
  `SCENE` int(11) NOT NULL COMMENT '场景ID',
  `CREATE_APP` varchar(1000) DEFAULT '' COMMENT '创建应用',
  `CREATE_USER` char(26) DEFAULT '' COMMENT '创建用户',
  `CREATE_TIME` char(26) DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KMeans生产结果表'
#*************************************************
#生产模型记录表
#*************************************************
CREATE TABLE IF NOT EXISTS `T_PRODUCE_MODEL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `MODEL_TYPE` int(11) NOT NULL COMMENT '模型类型',
  `MODEL_NAME` varchar(200) DEFAULT '' COMMENT '模型名称',
  `MODEL_NO` varchar(100) DEFAULT '' COMMENT '模型序列号',
  `PREDICT_ID` int(11) NOT NULL COMMENT '预测指标ID',
  `SCENE` int(11) NOT NULL COMMENT '场景ID',
  `CREATE_USER` char(26) DEFAULT '' COMMENT '创建人',
  `CREATE_TIME` char(26) DEFAULT '' COMMENT '创建时间',
  `LAST_UPD_USER` char(26) DEFAULT '' COMMENT '最后编辑人',
  `LAST_UPD_TIME` char(26) DEFAULT '' COMMENT '最后编辑时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生产模型记录表'
#*************************************************
#上传业务数据文件记录表
#*************************************************
CREATE TABLE IF NOT EXISTS `T_PRODUCT_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `FILE_NAME` varchar(1000) DEFAULT '' COMMENT '文件ID',
  `HDFS_NAME` varchar(1000) DEFAULT '' COMMENT '上传文件名',
  `FILE_TYPE` varchar(10) DEFAULT '' COMMENT '文件类型',
  `FILE_SIZE` varchar(1000) DEFAULT '' COMMENT '文件大小',
  `FILE_DESC` varchar(1000) DEFAULT '' COMMENT '文件描述',
  `SCENE` int(11) NOT NULL COMMENT '场景',
  `MODEL` varchar(1000) DEFAULT '' COMMENT '分析模型',
  `STATUS` int(11) DEFAULT '0' NOT NULL COMMENT '计算状态，0-未处理，1-正在计算，2-计算成功，3-计算失败',
  `EXTRA` varchar(1000) DEFAULT '' COMMENT '扩展字段',
  `UNIT` varchar(50) DEFAULT '' COMMENT '部门',
  `UPLOAD_USER` char(26) DEFAULT '' COMMENT '上传用户',
  `UPLOAD_TIME` char(26) DEFAULT '' COMMENT '上传时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传业务数据文件记录表'
#*************************************************
#严格匹配策略配置表
#*************************************************
CREATE TABLE IF NOT EXISTS `T_STRATEGY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `SCENE` int(11) NOT NULL COMMENT '文件ID',
  `CONDS` varchar(2000) DEFAULT '' COMMENT '上传文件名',
  `EXE_CODE` varchar(1000) DEFAULT '' COMMENT '文件类型',
  `EXE_DESC` varchar(1000) DEFAULT '' COMMENT '文件大小',
  `CREATE_USER` char(26) DEFAULT '' COMMENT '创建人',
  `CREATE_TIME` char(26) DEFAULT '' COMMENT '创建时间',
  `LAST_UPD_USER` char(26) DEFAULT '' COMMENT '最后编辑人',
  `LAST_UPD_TIME` char(26) DEFAULT '' COMMENT '最后编辑时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='严格匹配策略配置表'
#*************************************************
#FPGrowth生产结果表
#*************************************************
CREATE TABLE IF NOT EXISTS `T_FPGROWTH_RESULT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `FILE_ID` int(11) NOT NULL COMMENT '生产数据文件ID',
  `TRAIN_RES` varchar(1000) DEFAULT '' COMMENT '结果文件集存储路径',
  `RULE_RES` varchar(1000) DEFAULT '' COMMENT '频度规则文件位置',
  `PERFORMANCE` varchar(1000) DEFAULT '' COMMENT '性能度量',
  `MODEL_ARGS` varchar(1000) DEFAULT '' COMMENT '输入参数',
  `SCENE` int(11) NOT NULL COMMENT '场景ID',
  `CREATE_APP` char(26) DEFAULT '' COMMENT '创建应用',
  `CREATE_USER` char(26) DEFAULT '' COMMENT '创建用户',
  `CREATE_TIME` char(26) DEFAULT '' COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FPGrowth生产结果表'