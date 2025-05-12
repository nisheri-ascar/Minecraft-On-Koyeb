#!/bin/bash

./webserve.sh &
./playit &
./setup.sh &&
./start-server.sh
