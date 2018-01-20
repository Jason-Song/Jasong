#!/bin/bash
if [ $# -eq 3 ];then 
  rm -rf ../model/produce/$3
  mkdir ../model/produce/$3
  mkdir ../model/produce/$3/$1
  cp -r ../model/train/$3/$1/$2/* ../model/produce/$3/$1/
else
  echo "error:needs three args"
fi
