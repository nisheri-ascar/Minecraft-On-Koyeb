#!/bin/bash

./webserve.sh &
./setup.sh && echo "setup complete!"
./playit.sh &
sleep 120 && ./start-viaproxy.sh &
./start-server.sh 
