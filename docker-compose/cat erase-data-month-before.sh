#!/bin/bash
# written by scq in yaeher at 2020-05-06
# v1.0

set -e

_days_before=`date -d '-1 months' +%Y.%m`

STATE=$(curl -s -u elastic:Kv9brHjotk3s -XDELETE http://localhost:9200/*-"${_days_before}*" | awk -F'[:}]' '{print $2}')

if [ x"${STATE}" == x"true" ];then
   echo "erase date before ${_days_before} success." >> clear-indices.log
else
   echo "erase failed! please check." >> cler-indices.log
fi
