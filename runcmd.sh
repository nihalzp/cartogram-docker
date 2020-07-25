#!/bin/bash


CONTAINER=`docker-compose ps | awk -v container="$1" '$1~container && $0~/Up/ { print $1 }'`
if [ -z "$CONTAINER" ]
then
	echo "Docker application not started."
	exit 1
else
	docker exec -it $CONTAINER "${@:2}"
	if [ `uname -s` = "Linux" ]
	then
	    sudo chown -R $USER:$USER cartogram-web/ cartogram-serverless/
	fi
fi
