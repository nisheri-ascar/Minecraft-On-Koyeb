#!/bin/bash

if [[ -x "$(command -v darkhttpd)" ]]; then
	darkhttpd /home/server/web --port 8000 &
	exit 0
else
	echo "darkhttpd not found!!"
	exit 1
fi

