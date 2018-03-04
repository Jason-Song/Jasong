#!/bin/bash
if [ $# -eq 2 ];then 
  rm -rf ../model/produce/$1/*
  cp -r ../model/train/$1/$2/* ../model/produce/$1/
else
  echo "error:needs two args"
fi
