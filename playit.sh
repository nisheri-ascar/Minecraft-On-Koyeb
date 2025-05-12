#!/bin/bash


if [ -z "$PLAYIT_SECRET_KEY" ]; then
    echo "ERROR!!! PLAYIT_SECRET_KEY IS EMPTY!"
    echo "Refer to readme to fix this error."
    exit 127
fi

bin/playit-binary --secret=${PLAYIT_SECRET_KEY} --platform_docker -s

echo "if it gets past here, then i love you so much i miss you so much balik kana sakin uwu"
