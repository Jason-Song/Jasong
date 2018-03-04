#!/bin/bash
if [ $# -eq 5 ];then 
  hadoop fs -test -d $5$3
  if [ $? -eq 0 ];then 
     hadoop fs -rm -r -f $5$3/$1/*
  else
     hadoop fs -mkdir $5$3
     hadoop fs -mkdir $5$3/$1
  fi
  hadoop fs -cp $4$3/$1/$2/* $5$3/$1/
else
  echo "error:needs five args"
fi
