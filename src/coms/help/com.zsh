#!/usr/bin/sh
FW_DIR=$(dirname $(dirname $(cd `dirname $0` && pwd)))

if [ $# == 0 ]; then
    echo -e "no arguments were given"
    exit 1
fi
if ! [ -d $FW_DIR/coms/$1 ]; then
    echo -e "$1 command does not exists"
    exit 1
fi

CAT=$(cat $FW_DIR/coms/$1/info.txt | grep "?")
echo -e ${CAT//'?'/}