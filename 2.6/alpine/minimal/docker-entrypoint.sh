#!/bin/bash
set -e

mkdir -p $MONGODATA

if [ "${1:0:1}" = '-' ]; then
	set -- mongod "$@"
fi

if [ "$1" = 'mongod' ]; then
	chown -R mongodb:mongodb $MONGODATA
	exec su-exec mongodb "$@" --dbpath $MONGODATA --smallfiles
fi

exec "$@"
