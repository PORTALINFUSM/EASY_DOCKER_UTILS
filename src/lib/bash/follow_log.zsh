#!/usr/bin/sh
LOG_FILE_LOC=$(python -u $3/lib/py/get_field.py $2 'output')
FILE=(${LOG_FILE_LOC//'/'/ })
FOLDER=$(cd $2 && cd `dirname $LOG_FILE_LOC` && pwd)

if [ $? != 0 ] || [ -z $LOG_FILE_LOC ]; then
    REDIRECT="$2/$1-log.ansi"
else
    REDIRECT="$FOLDER/${FILE[-1]}"
fi
sudo docker logs --follow --details $1 &> $REDIRECT
