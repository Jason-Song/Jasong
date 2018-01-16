--添加训练状态
alter table LYODSVW.T_TRAIN_DATA add (STATUS NUMBER default 0 not null);
--USER更改字符型
alter table LYODSVW.T_TRAIN_DATA DROP COLUMN UPLOAD_USER;
alter table LYODSVW.T_TRAIN_DATA ADD UPLOAD_USER CHAR(26);
alter table LYODSVW.T_SCENE DROP COLUMN LAST_UPD_USER;
alter table LYODSVW.T_SCENE ADD LAST_UPD_USER CHAR(26);
alter table LYODSVW.T_SCENE DROP COLUMN CREATE_USER;
alter table LYODSVW.T_SCENE ADD CREATE_USER CHAR(26);
alter table LYODSVW.T_STRATEGY DROP COLUMN LAST_UPD_USER;
alter table LYODSVW.T_STRATEGY ADD LAST_UPD_USER CHAR(26);
alter table LYODSVW.T_STRATEGY DROP COLUMN CREATE_USER;
alter table LYODSVW.T_STRATEGY ADD CREATE_USER CHAR(26);
alter table LYODSVW.T_KMEANS_INDEX DROP COLUMN CREATE_USER;
alter table LYODSVW.T_KMEANS_INDEX ADD CREATE_USER CHAR(26);
alter table LYODSVW.T_PREDICT_INDEX DROP COLUMN CREATE_USER;
alter table LYODSVW.T_PREDICT_INDEX ADD CREATE_USER CHAR(26);
alter table LYODSVW.T_PRODUCT_DATA DROP COLUMN UPLOAD_USER;
alter table LYODSVW.T_PRODUCT_DATA ADD UPLOAD_USER CHAR(26);
alter table LYODSVW.T_PRODUCT_MODEL DROP COLUMN LAST_UPD_USER;
alter table LYODSVW.T_PRODUCT_MODEL ADD LAST_UPD_USER CHAR(26);
alter table LYODSVW.T_PRODUCT_MODEL DROP COLUMN CREATE_USER;
alter table LYODSVW.T_PRODUCT_MODEL ADD CREATE_USER CHAR(26);
--添加模型位置
alter table LYODSVW.T_KMEANS_INDEX ADD TRAIN_MODEL VARCHAR2(1000);
