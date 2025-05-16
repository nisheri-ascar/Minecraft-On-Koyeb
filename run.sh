#!/bin/bash

./webserve.sh &
./setup.sh && echo "setup complete!" && sleep 30 
./playit.sh &
./start-server.sh 
