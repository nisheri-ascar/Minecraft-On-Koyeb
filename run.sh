#!/bin/bash

./webserve.sh &
./setup.sh && echo "Setup complete!"
./playit.sh &
./start-server.sh 
