#!/bin/bash
hadoop fs -mkdir /datafiles
hadoop fs -mkdir /datafiles/graphx
hadoop fs -mkdir /datafiles/ml
hadoop fs -mkdir /datafiles/ml/upload
hadoop fs -mkdir /datafiles/ml/upload/train
hadoop fs -mkdir /datafiles/ml/upload/produce
hadoop fs -mkdir /datafiles/ml/predict
hadoop fs -mkdir /datafiles/ml/predict/train
hadoop fs -mkdir /datafiles/ml/predict/produce
hadoop fs -mkdir /datafiles/streaming
hadoop fs -mkdir /datafiles/sql