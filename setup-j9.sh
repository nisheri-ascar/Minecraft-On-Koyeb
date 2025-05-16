#!/bin/bash

wget https://github.com/ibmruntimes/semeru8-binaries/releases/download/jdk8u452-b09_openj9-0.51.0/ibm-semeru-open-jre_x64_linux_8u452b09_openj9-0.51.0.tar.gz -O j9.tar.gz

tar -zxvf j9.tar.gz
export PATH=$PATH:/home/server/jdk8u452-b09-jre/bin
