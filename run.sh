#!/bin/bash

./webserve.sh &
./playit.sh
./setup.sh &&
./start-server.sh 
