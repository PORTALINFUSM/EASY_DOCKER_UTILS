#!/usr/bin/sh
FW_DIR=$(dirname $(dirname $(cd `dirname $0` && pwd)))

if [ -z $1 ]; then
    echo -e "Enter the project name:"
    read -r NAME
else
    NAME=$1
fi

sudo echo -e '{
    "env": {
        "TEST_VARIABLE": "http://localhost:80"
    },
    "ports": {
        "3000": "3000"
    }
}' &> ./docker.env.json

sudo echo -e 'FROM ubuntu:latest

WORKDIR /app

COPY ./ ./

ENTRYPOINT [ "sh", "entrypoint.sh" ]' &> ./Dockerfile

sudo echo -e 'printenv' &> ./entrypoint.sh

sudo bash $FW_DIR/coms/set/com.zsh $(pwd) $NAME