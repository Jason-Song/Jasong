--*************************************************
--场景配置表
--*************************************************
--序号
CREATE SEQUENCE LYODSVW.SEQ_T_SCENE;
--建表
DROP TABLE LYODSVW.T_SCENE;
CREATE TABLE LYODSVW.T_SCENE (
    ID                 NUMBER NOT NULL,
	NAME		  	   VARCHAR2(500),
	SCENE_DESC		   VARCHAR2(1000),
	COND_NAME		   VARCHAR2(1000),
    STRATEGY_NAME	   VARCHAR2(1000),
    CREATE_USER        CHAR(26),
    CREATE_TIME        CHAR(26),
    LAST_UPD_USER      CHAR(26),
    LAST_UPD_TIME      CHAR(26),
    CONSTRAINT T_SCENE_PK PRIMARY KEY (ID)
);
COMMENT ON TABLE LYODSVW.T_SCENE IS '场景配置表';
COMMENT ON COLUMN LYODSVW.T_SCENE.ID IS '场景ID';
COMMENT ON COLUMN LYODSVW.T_SCENE.NAME IS '场景名';
COMMENT ON COLUMN LYODSVW.T_SCENE.SCENE_DESC IS '场景描述';
COMMENT ON COLUMN LYODSVW.T_SCENE.COND_NAME IS '条件名';
COMMENT ON COLUMN LYODSVW.T_SCENE.STRATEGY_NAME IS '策略名';
COMMENT ON COLUMN LYODSVW.T_SCENE.CREATE_USER IS '创建人';
COMMENT ON COLUMN LYODSVW.T_SCENE.CREATE_TIME IS '创建时间';
COMMENT ON COLUMN LYODSVW.T_SCENE.LAST_UPD_USER IS '最后编辑人';
COMMENT ON COLUMN LYODSVW.T_SCENE.LAST_UPD_TIME IS '最后编辑时间';
--*************************************************
--严格匹配策略配置表
--*************************************************
--序号
CREATE SEQUENCE LYODSVW.SEQ_T_STRATEGY;
--建表
DROP TABLE LYODSVW.T_STRATEGY;
CREATE TABLE LYODSVW.T_STRATEGY (
    ID                 NUMBER NOT NULL,
    SCENE              NUMBER NOT NULL,
    CONDS         	   VARCHAR2(2000),
    EXE_CODE		   VARCHAR2(1000),
    EXE_DESC		   VARCHAR2(1000),
    CREATE_USER        CHAR(26),
    CREATE_TIME        CHAR(26),
    LAST_UPD_USER      CHAR(26),
    LAST_UPD_TIME      CHAR(26),
    CONSTRAINT T_STRATEGY_PK PRIMARY KEY (ID)
);
COMMENT ON TABLE LYODSVW.T_STRATEGY IS '严格匹配策略配置表';
COMMENT ON COLUMN LYODSVW.T_STRATEGY.ID IS '策略ID';
COMMENT ON COLUMN LYODSVW.T_STRATEGY.SCENE IS '场景ID';
COMMENT ON COLUMN LYODSVW.T_STRATEGY.CONDS IS '策略需要满足的条件';
COMMENT ON COLUMN LYODSVW.T_STRATEGY.EXE_CODE IS '执行码';
COMMENT ON COLUMN LYODSVW.T_STRATEGY.EXE_DESC IS '策略描述';
COMMENT ON COLUMN LYODSVW.T_STRATEGY.CREATE_USER IS '创建人';
COMMENT ON COLUMN LYODSVW.T_STRATEGY.CREATE_TIME IS '创建时间';
COMMENT ON COLUMN LYODSVW.T_STRATEGY.LAST_UPD_USER IS '最后编辑人';
COMMENT ON COLUMN LYODSVW.T_STRATEGY.LAST_UPD_TIME IS '最后编辑时间';
--*************************************************
--HDFS上传训练数据文件记录表
--*************************************************
--序号
CREATE SEQUENCE LYODSVW.SEQ_T_TRAIN_DATA;
--建表
DROP TABLE LYODSVW.T_TRAIN_DATA;
CREATE TABLE LYODSVW.T_TRAIN_DATA (
    ID                 NUMBER NOT NULL,
    FILE_NAME		   VARCHAR2(1000),
    HDFS_NAME          VARCHAR2(1000),
    FILE_TYPE		   VARCHAR2(10),
    FILE_SIZE		   VARCHAR2(1000),
    FILE_DESC		   VARCHAR2(1000),
    SCENE		   	   NUMBER NOT NULL,
    MODEL		   	   NUMBER NOT NULL,
    STATUS		   	   NUMBER DEFAULT 0 NOT NULL,
    EXTRA			   VARCHAR2(1000),
    UNIT			   VARCHAR2(50),
    UPLOAD_USER        CHAR(26),
    UPLOAD_TIME        CHAR(26),
    CONSTRAINT T_TRAIN_DATA_PK PRIMARY KEY (ID),
    CONSTRAINT HDFS_NAME_UNIQUE_PK unique (HDFS_NAME)
);
COMMENT ON TABLE LYODSVW.T_TRAIN_DATA IS 'HDFS上传训练数据文件记录表';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.ID IS '文件ID';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.FILE_NAME IS '上传文件名';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.HDFS_NAME IS '文件位置';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.FILE_TYPE IS '文件类型';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.FILE_SIZE IS '文件大小';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.FILE_DESC IS '文件描述';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.SCENE IS '场景';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.MODEL IS '训练数据对应模型';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.STATUS IS '训练状态，0-未处理，1-正在训练，2-训练成功，3-训练失败';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.EXTRA IS '扩展字段';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.UNIT IS '部门';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.UPLOAD_USER IS '上传用户';
COMMENT ON COLUMN LYODSVW.T_TRAIN_DATA.UPLOAD_TIME IS '上传时间';
--*************************************************
--模型训练结果表
--*************************************************
--序号
CREATE SEQUENCE LYODSVW.SEQ_T_PREDICT_INDEX;
--建表
DROP TABLE LYODSVW.T_PREDICT_INDEX;
CREATE TABLE LYODSVW.T_PREDICT_INDEX (
    ID                 NUMBER NOT NULL,
    FILE_ID            NUMBER NOT NULL,
	TRAIN_RES		   VARCHAR2(1000),
    ACCURACY		   VARCHAR2(1000),
    TRAIN_NO		   NUMBER,
    TEST_NO		   	   NUMBER,
    PERFORMANCE		   VARCHAR2(1000),
    CLASS_NO		   NUMBER,
    MATRIX			   VARCHAR2(1000),
    TRAIN_MODEL		   VARCHAR2(1000),
    MODEL_ARGS		   VARCHAR2(1000),
    MODEL_TREE		   VARCHAR2(1000),
    SCENE		   	   NUMBER NOT NULL,
    CREATE_APP         VARCHAR2(1000),
    CREATE_USER        CHAR(26),
    CREATE_TIME        CHAR(26),
    CONSTRAINT T_PREDICT_INDEX_PK PRIMARY KEY (ID),
    CONSTRAINT T_PREDICT_INDEX_UNIQUE_PK unique (FILE_ID)
);
COMMENT ON TABLE LYODSVW.T_PREDICT_INDEX IS '模型训练指标结果表';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.ID IS 'ID';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.FILE_ID IS '文件ID';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.TRAIN_RES IS '预测结果集存储路径';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.ACCURACY IS '准确率';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.TRAIN_NO IS '训练样本数';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.TEST_NO IS '测试样本数';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.PERFORMANCE IS '性能度量';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.CLASS_NO IS '分类数';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.MATRIX IS '混淆矩阵';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.TRAIN_MODEL IS '训练模型存储位置';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.MODEL_ARGS IS '模型参数';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.MODEL_TREE IS '模型决策树';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.CREATE_APP IS '创建应用';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.CREATE_USER IS '创建用户';
COMMENT ON COLUMN LYODSVW.T_PREDICT_INDEX.CREATE_TIME IS '创建时间';
--*************************************************
--上传业务数据文件记录表
--*************************************************
--序号
CREATE SEQUENCE LYODSVW.SEQ_T_PRODUCT_DATA;
--建表
DROP TABLE LYODSVW.T_PRODUCT_DATA;
CREATE TABLE LYODSVW.T_PRODUCT_DATA (
    ID              NUMBER NOT NULL,
    FILE_NAME       VARCHAR2(1000),
    HDFS_NAME       VARCHAR2(1000),
    FILE_TYPE       VARCHAR2(10),
    FILE_SIZE       VARCHAR2(1000),
    FILE_DESC       VARCHAR2(1000),
    EXTRA       	VARCHAR2(1000),
    SCENE           NUMBER NOT NULL,
    MODEL           NUMBER NOT NULL,
    STATUS          NUMBER DEFAULT 0 NOT NULL,
    UNIT         	VARCHAR2(50),
    UPLOAD_USER     CHAR(26),
    UPLOAD_TIME     CHAR(26),
    CONSTRAINT T_PRODUCT_DATA_PK PRIMARY KEY (ID),
    CONSTRAINT PRODUCT_HDFS_UNIQUE_PK unique (HDFS_NAME)
);
COMMENT ON TABLE LYODSVW.T_PRODUCT_DATA IS '上传业务数据文件记录表';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.ID IS '文件ID';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.FILE_NAME IS '上传文件名';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.HDFS_NAME IS '文件位置';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.FILE_TYPE IS '文件类型';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.FILE_SIZE IS '文件大小';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.FILE_DESC IS '文件描述';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.EXTRA IS '扩展字段';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.SCENE IS '场景';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.MODEL IS '分析模型';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.STATUS IS '处理状态';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.UNIT IS '部门';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.UPLOAD_USER IS '上传用户';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_DATA.UPLOAD_TIME IS '上传时间';
--*************************************************
--生产模型记录表
--*************************************************
--序号
CREATE SEQUENCE LYODSVW.SEQ_T_PRODUCT_MODEL;
--建表
DROP TABLE LYODSVW.T_PRODUCT_MODEL;
CREATE TABLE LYODSVW.T_PRODUCT_MODEL (
    ID                 NUMBER NOT NULL,
    MODEL_TYPE		   NUMBER NOT NULL,
    MODEL_NAME		   VARCHAR2(200),
	MODEL_NO		   VARCHAR2(100),
	PREDICT_ID		   NUMBER NOT NULL,
    CREATE_USER        CHAR(26),
    CREATE_TIME        CHAR(26),
    LAST_UPD_USER      CHAR(26),
    LAST_UPD_TIME      CHAR(26),
    CONSTRAINT T_PRODUCT_MODEL_PK PRIMARY KEY (ID)
);
COMMENT ON TABLE LYODSVW.T_PRODUCT_MODEL IS '生产模型记录表';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_MODEL.ID IS 'ID';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_MODEL.MODEL_TYPE IS '模型类型';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_MODEL.MODEL_NAME IS '模型名称';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_MODEL.MODEL_NO IS '模型序列号';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_MODEL.PREDICT_ID IS '预测指标ID';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_MODEL.CREATE_USER IS '创建人';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_MODEL.CREATE_TIME IS '创建时间';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_MODEL.LAST_UPD_USER IS '最后编辑人';
COMMENT ON COLUMN LYODSVW.T_PRODUCT_MODEL.LAST_UPD_TIME IS '最后编辑时间';
--*************************************************
--KMeans训练结果表
--*************************************************
--序号
CREATE SEQUENCE LYODSVW.SEQ_T_KMEANS_INDEX;
--建表
DROP TABLE LYODSVW.T_KMEANS_INDEX;
CREATE TABLE LYODSVW.T_KMEANS_INDEX (
    ID                 NUMBER NOT NULL,
    FILE_ID            NUMBER NOT NULL,
	TRAIN_RES		   VARCHAR2(1000),
    WSSSE			   VARCHAR2(1000),
    PERFORMANCE		   VARCHAR2(1000),
    TRAIN_MODEL		   VARCHAR2(1000),
    MODEL_ARGS		   VARCHAR2(1000),
    SCENE		   	   NUMBER NOT NULL,
    CREATE_APP         VARCHAR2(1000),
    CREATE_USER        CHAR(26),
    CREATE_TIME        CHAR(26),
   	CONSTRAINT T_KMEANS_INDEX_PK PRIMARY KEY (ID)
);
COMMENT ON TABLE LYODSVW.T_KMEANS_INDEX IS 'KMeans训练结果表';
COMMENT ON COLUMN LYODSVW.T_KMEANS_INDEX.ID IS 'ID';
COMMENT ON COLUMN LYODSVW.T_KMEANS_INDEX.FILE_ID IS '训练文件ID';
COMMENT ON COLUMN LYODSVW.T_KMEANS_INDEX.TRAIN_RES IS '结果文件集存储路径';
COMMENT ON COLUMN LYODSVW.T_KMEANS_INDEX.WSSSE IS '聚类总体方差';
COMMENT ON COLUMN LYODSVW.T_KMEANS_INDEX.PERFORMANCE IS '性能度量';
COMMENT ON COLUMN LYODSVW.T_KMEANS_INDEX.TRAIN_MODEL IS '训练模型位置';
COMMENT ON COLUMN LYODSVW.T_KMEANS_INDEX.MODEL_ARGS IS '模型参数';
COMMENT ON COLUMN LYODSVW.T_KMEANS_INDEX.SCENE IS '场景ID';
COMMENT ON COLUMN LYODSVW.T_KMEANS_INDEX.CREATE_APP IS '创建应用';
COMMENT ON COLUMN LYODSVW.T_KMEANS_INDEX.CREATE_USER IS '创建用户';
COMMENT ON COLUMN LYODSVW.T_KMEANS_INDEX.CREATE_TIME IS '创建时间';
--*************************************************
--KMeans生产结果表
--*************************************************
--序号
CREATE SEQUENCE LYODSVW.SEQ_T_KMEANS_RESULT;
--建表
DROP TABLE LYODSVW.T_KMEANS_RESULT;
CREATE TABLE LYODSVW.T_KMEANS_RESULT (
    ID                 NUMBER NOT NULL,
    FILE_ID            NUMBER NOT NULL,
	TRAIN_RES		   VARCHAR2(1000),
    WSSSE			   VARCHAR2(1000),
    PERFORMANCE		   VARCHAR2(1000),
    MODEL_ARGS		   VARCHAR2(1000),
    SCENE		   	   NUMBER NOT NULL,
    CREATE_APP         VARCHAR2(1000),
    CREATE_USER        CHAR(26),
    CREATE_TIME        CHAR(26),
   	CONSTRAINT T_KMEANS_RESULT_PK PRIMARY KEY (ID)
);
COMMENT ON TABLE LYODSVW.T_KMEANS_RESULT IS 'KMeans生产结果表';
COMMENT ON COLUMN LYODSVW.T_KMEANS_RESULT.ID IS 'ID';
COMMENT ON COLUMN LYODSVW.T_KMEANS_RESULT.FILE_ID IS '生产数据文件ID';
COMMENT ON COLUMN LYODSVW.T_KMEANS_RESULT.TRAIN_RES IS '结果文件集存储路径';
COMMENT ON COLUMN LYODSVW.T_KMEANS_RESULT.WSSSE IS '聚类总体方差';
COMMENT ON COLUMN LYODSVW.T_KMEANS_RESULT.PERFORMANCE IS '性能度量';
COMMENT ON COLUMN LYODSVW.T_KMEANS_RESULT.MODEL_ARGS IS '输入参数';
COMMENT ON COLUMN LYODSVW.T_KMEANS_RESULT.SCENE IS '场景ID';
COMMENT ON COLUMN LYODSVW.T_KMEANS_RESULT.CREATE_APP IS '创建应用';
COMMENT ON COLUMN LYODSVW.T_KMEANS_RESULT.CREATE_USER IS '创建用户';
COMMENT ON COLUMN LYODSVW.T_KMEANS_RESULT.CREATE_TIME IS '创建时间';
--*************************************************
--KMeans中心点坐标记录表
--*************************************************
--序号
CREATE SEQUENCE LYODSVW.SEQ_T_KMEANS_CENTERS;
--建表
DROP TABLE LYODSVW.T_KMEANS_CENTERS;
CREATE TABLE LYODSVW.T_KMEANS_CENTERS (
    ID                 NUMBER NOT NULL,
    KMEANS_ID          NUMBER NOT NULL,
	CLUSTER_ID		   VARCHAR2(100),
	CENTER			   VARCHAR2(1000),
	CONSTRAINT T_KMEANS_CENTERS_PK PRIMARY KEY (ID)
);
COMMENT ON TABLE LYODSVW.T_KMEANS_CENTERS IS 'KMeans中心点坐标记录表';
COMMENT ON COLUMN LYODSVW.T_KMEANS_CENTERS.ID IS 'ID';
COMMENT ON COLUMN LYODSVW.T_KMEANS_CENTERS.KMEANS_ID IS 'KMeans训练结果ID';
COMMENT ON COLUMN LYODSVW.T_KMEANS_CENTERS.CLUSTER_ID IS '簇序号';
COMMENT ON COLUMN LYODSVW.T_KMEANS_CENTERS.CENTER IS '中心点坐标';

--系统user
-- Create sequence 
create sequence SEQ_T_USER
minvalue 0
maxvalue 9999999999999999999999999999
start with 0
increment by 1
cache 20;
-- Create table
create table T_USER
(
  userid              NUMBER not null,
  cid                 NUMBER not null,
  name                VARCHAR2(100) not null,
  loginname           VARCHAR2(50) not null,
  email               VARCHAR2(100),
  phone               VARCHAR2(50),
  mobile              VARCHAR2(30),
  fax                 VARCHAR2(50),
  address             VARCHAR2(300),
  salt                VARCHAR2(128) not null,
  password            VARCHAR2(200) not null,
  failtimes           NUMBER(5) default 0,
  initpwd             NUMBER(5) default 1,
  status              NUMBER(5) default 0,
  creatorid           NUMBER not null,
  createdate          CHAR(26) not null,
  modifierid          NUMBER not null,
  lastmodifydate      CHAR(26) not null,
  realtime_state      VARCHAR2(200),
  realtime_unit       VARCHAR2(200),
  batch_unit          VARCHAR2(200),
  lock_reason         NUMBER(5),
  pwd_last_modifydate VARCHAR2(26),
  history_pwd         VARCHAR2(4000),
  last_login_date     CHAR(26),
  last_role           NUMBER,
  staff_id            VARCHAR2(128)
)
tablespace LYODSVW
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column T_USER.lock_reason
  is '?????';
comment on column T_USER.pwd_last_modifydate
  is '?????????';
comment on column T_USER.history_pwd
  is '?????';
comment on column T_USER.staff_id
  is '????????????';
-- Create/Recreate indexes 
create index IDX_T_USER_CREATEID on T_USER (CREATORID)
  tablespace LYODSVW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_T_USER_MODIFIERID on T_USER (MODIFIERID)
  tablespace LYODSVW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index T_USER_IDX1 on T_USER (CID, USERID)
  tablespace LYODSVW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index T_USER_IDX2 on T_USER (CID, LOGINNAME)
  tablespace LYODSVW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_USER
  add primary key (USERID)
  using index 
  tablespace LYODSVW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table T_USER
  add constraint FK_T_USER_CREATEID foreign key (CREATORID)
  references T_USER (USERID);
alter table T_USER
  add constraint FK_T_USER_MODIFIERID foreign key (MODIFIERID)
  references T_USER (USERID);
-- Create sequence 
create sequence SEQ_T_CODE_DTL
minvalue 0
maxvalue 9999999999999999999999999999
start with 0
increment by 1
cache 20;
-- Create table
create table T_CODE_DTL
(
  codedtlid      NUMBER not null,
  refmastercode  VARCHAR2(50) not null,
  refcode        VARCHAR2(50) not null,
  refdesc        VARCHAR2(200) not null,
  refstatus      NUMBER not null,
  ref1           NUMBER,
  seq            NUMBER,
  creatorid      NUMBER not null,
  createdate     CHAR(26) not null,
  modifierid     NUMBER not null,
  lastmodifydate CHAR(26) not null
)
tablespace LYODSVW
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IDX_CODE_DTL_MASTCODE on T_CODE_DTL (REFMASTERCODE, REFCODE)
  tablespace LYODSVW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_CODE_DTL
  add primary key (CODEDTLID)
  using index 
  tablespace LYODSVW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
