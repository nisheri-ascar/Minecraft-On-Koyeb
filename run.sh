#!/bin/bash

./webserve.sh &
./setup.sh &&
./playit.sh &
./start-server.sh 
