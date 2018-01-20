#!/bin/bash
if [ $# -eq 3 ];then 
  if [ ! -d "../model/produce/$3" ];then 
     mkdir ../model/produce/$3
     mkdir ../model/produce/$3/$1
  else
     rm -rf ../model/produce/$3/$1/*
  fi
  cp -r ../model/train/$3/$1/$2/* ../model/produce/$3/$1/
else
  echo "error:needs three args"
fi
