#!/bin/bash


if [ -z "$PLAYIT_SECRET_KEY" ]; then
    echo "ERROR!!! PLAYIT_SECRET_KEY IS EMPTY!"
    echo "Refer to readme to fix this error."
    exit 127
fi

bin/playit-binary --secret=${PLAYIT_SECRET_KEY} --platform_docker -s
