#!/bin/bash
  
webname="NiguxWeb"
port="8081"
curPath=$(dirname $(readlink -f "$0"))

if [ "$1" == "start" ];
then
        startweb=`sudo nohup dotnet ${curPath}/${webname}.dll --urls http://0.0.0.0:${port} > nohup.out 2>&1 &`
elif [ "$1" == "stop" ];
then
        info=`sudo ps -aux | grep "nohup dotnet ${curPath}/${webname}.dll" | grep -v "grep" | awk '{print $2}'`
        stopweb=`sudo kill ${info}`
elif [ "$1" == "status" ];
then
        echo `sudo ps -aux | grep "nohup dotnet ${curPath}/${webname}.dll" | grep -v "grep"`
else
        echo "无效的命令"
fi