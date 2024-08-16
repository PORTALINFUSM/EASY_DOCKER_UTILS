#!/usr/bin/sh
FW_DIR=$(dirname $(dirname $(cd `dirname $0` && pwd)))

if ! [ -f /tmp/edu/$1.eduf ]; then
    echo -e "$1 project does not exists"
    exit 1
fi

source /tmp/edu/$1.eduf

if [ $STATE == "off" ]; then
    echo -e "$1 project is already off"
    exit 0
fi

if [ $LAST_PID == "none" ]; then
    echo -e "ERROR with $1 project PID"
    exit 1
fi

sudo docker stop $LAST_PID
sudo docker container rm $LAST_PID
sudo docker image rm $1

echo -e "PJ_DIR=$PJ_DIR\nSTATE=off\nLAST_PID=$LAST_PID" &> /tmp/edu/$1.eduf