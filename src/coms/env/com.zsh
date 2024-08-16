#!/usr/bin/sh
FW_DIR=$(dirname $(dirname $(cd `dirname $0` && pwd)))

if [ $# != 1 ]; then
    echo -e "this command only accepts 1 argument"
    exit 1
fi

if ! [ -f /etc/edu/$1.eduf ]; then
    echo -e "$1 project does not exists"
    exit 1
fi

source /etc/edu/$1.eduf

if [ -f $PJ_DIR/docker.env ]; then
    echo -e "$1 already has a env file"
    exit 0
fi

touch $PJ_DIR/docker.env