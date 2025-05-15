#!/bin/bash

./webserve.sh &
./src/setup.sh && echo "Setup complete!"
./playit.sh &
./start-server.sh 
