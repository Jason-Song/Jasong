#!/bin/bash
mkdir /home/hadoop/WisdomBrain-tomcat_7.0/webapps3/wb-market/progress
hadoop fs -mkdir /datafiles
hadoop fs -mkdir /datafiles/graphx
hadoop fs -mkdir /datafiles/ml
hadoop fs -mkdir /datafiles/ml/upload
hadoop fs -mkdir /datafiles/ml/upload/train
hadoop fs -mkdir /datafiles/ml/upload/produce
hadoop fs -mkdir /datafiles/ml/predict
hadoop fs -mkdir /datafiles/ml/predict/train
hadoop fs -mkdir /datafiles/ml/predict/produce
hadoop fs -mkdir /datafiles/ml/model
hadoop fs -mkdir /datafiles/ml/model/train
hadoop fs -mkdir /datafiles/ml/model/produce
hadoop fs -mkdir /datafiles/ml/rowCol
hadoop fs -mkdir /datafiles/streaming
hadoop fs -mkdir /datafiles/sql
hadoop fs -mkdir /datafiles/sql/filter
