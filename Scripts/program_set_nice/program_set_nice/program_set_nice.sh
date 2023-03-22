#!/bin/bash

if [ $# -ne 2 ]; then
echo "Usage: $0 program_name priority"
exit 1
fi

program_name=$1
priority=$2

# 获取进程PID
pid=`pidof $program_name`
if [ -z $pid ]; then
echo "Can not find $program_name PID"
exit 1
fi

# 设置调度优先级
renice $priority $pid




