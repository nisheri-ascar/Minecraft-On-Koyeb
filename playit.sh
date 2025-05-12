#!/bin/bash


if [ -z "$PLAYIT_SECRET_KEY" ]; then
    echo "ERROR!!! PLAYIT_SECRET_KEY IS EMPTY!"
    echo "Refer to readme to fix this error."
    exit 127
fi

docker run --rm --net=host -e SECRET_KEY=${PLAYIT_SECRET_KEY} ghcr.io/playit-cloud/playit-agent:0.15
