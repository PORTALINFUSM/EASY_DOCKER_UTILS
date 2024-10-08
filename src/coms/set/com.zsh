#!/usr/bin/sh
FW_DIR=$(dirname $(dirname $(cd `dirname $0` && pwd)))

if [ $# != 2 ]; then
    exit 0
fi

PJ_DIR=$(cd $(pwd) && cd $1 && pwd)

if [ $? != 0 ]; then
    exit 1
fi

if [ -f $EDUF_DIR/$2.eduf ]; then
    echo -e "tag $2 already have a project linked"
    exit 1
fi

sudo echo -e "PJ_DIR=$PJ_DIR\nSTATE=off\nLAST_PID=none" &> $EDUF_DIR/$2.eduf
echo -e "Project linked succesfully to $2"