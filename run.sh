#!/bin/bash

./webserve.sh &
./setup.sh && echo "setup complete!"
./playit.sh &
./start-server.sh 
