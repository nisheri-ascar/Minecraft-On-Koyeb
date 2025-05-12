#!/bin/bash
docker run --rm -it --net=host -e SECRET_KEY=${PLAYIT_SECRET_KEY} ghcr.io/playit-cloud/playit-agent:0.15
