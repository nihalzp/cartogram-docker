#!/bin/bash

if [ `uname -s` = Linux ]
then
	CONTAINER=`sudo docker-compose ps | awk -v container="$1" '$1~container && $0~/Up/ { print $1 }'`
	if [ -z "$CONTAINER" ]
	then
		echo "Docker application not started."
		exit 1
	else
		sudo docker exec -it $CONTAINER "${@:2}"
		sudo chown `id -un`:`id -gn` -R cartogram-web/
		sudo chown `id -un`:`id -gn` -R cartogram-serverless/
	fi
else
	CONTAINER=`docker-compose ps | awk -v container="$1" '$1~container && $0~/Up/ { print $1 }'`
        if [ -z "$CONTAINER" ]
        then
                echo "Docker application not started."
                exit 1
        else
                docker exec -it $CONTAINER "${@:2}"
        fi
fi