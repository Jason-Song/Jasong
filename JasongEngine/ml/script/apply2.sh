#!/bin/bash
if["$#" -eq "2"];then
  cd ..
  curdir="`pwd`"
###  rm -rf $curdir/model/produce/$1/*
  #cp $curdir/model/train/$1/$2/* $curdir/model/produce/$1/
else
  echo "error:need two args"
fi
