#!/bin/bash

wget https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz
tar -xvf tmate-2.4.0-static-linux-amd64.tar.xz  
rm tmate-2.4.0-static-linux-amd64.tar.xz 
tar -xvf tmate-2.4.0-static-linux-amd64/tmate
./tmate-2.4.0-static-linux-amd64/tmate -F
