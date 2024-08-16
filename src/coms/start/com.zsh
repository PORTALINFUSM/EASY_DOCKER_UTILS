#!/usr/bin/sh
FW_DIR=$(dirname $(dirname $(cd `dirname $0` && pwd)))

if ! [ -f /tmp/edu/$1.eduf ]; then
    echo -e "$1 project does not exists"
    exit 1
fi

source /tmp/edu/$1.eduf

if [ $STATE == "running" ] || [ $STATE == "building" ]; then
    echo -e "$1 project is already running"
    exit 0
fi

sudo docker build $PJ_DIR --file $PJ_DIR/Dockerfile --tag $1:latest

if [ $? == 0 ]; then
    CAT=$(cat /tmp/edu/$1.eduf | grep -v "LAST_PID" | grep -v "STATE")
    echo -e "$CAT\nSTATE=builded\nLAST_PID=$LAST_PID" &> /tmp/edu/$1.eduf
fi

COM=$(python -u $FW_DIR/lib/py/get_command.py $PJ_DIR "$1")

PID=$($COM)

if [ $? == 0 ]; then
    CAT=$(cat /tmp/edu/$1.eduf | grep -v "LAST_PID" | grep -v "STATE")
    echo -e "$CAT\nSTATE=started\nLAST_PID=$PID" &> /tmp/edu/$1.eduf
fi

bash $FW_DIR/lib/bash/follow_log.zsh $1 $PJ_DIR $FW_DIR