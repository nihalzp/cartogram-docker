#!/bin/bash

if [ `uname -s` = Linux ]
then
	CONTAINER=`sudo docker-compose ps | awk '$1~/web/ && $0~/Up/ { print $1 }'`
	if [ -z "$CONTAINER" ]
	then
		echo "Docker application not started."
		exit 1
	else
		sudo docker exec -it $CONTAINER python addmap.py "$@"
		sudo chown `id -un`:`id -gn` -R cartogram-web/
	fi
else
	CONTAINER=`docker-compose ps | awk '$1~/web/ && $0~/Up/ { print $1 }'`
        if [ -z "$CONTAINER" ]
        then
                echo "Docker application not started."
                exit 1
        else
                docker exec -it $CONTAINER python addmap.py "$@"
        fi
fi


