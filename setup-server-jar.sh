#!/bin/bash

paperServerVersion=1.21.4
paperBuildNumber=230

echo "Patching jar"
# Download Main jar
wget https://api.papermc.io/v2/projects/paper/versions/${paperServerVersion}/builds/${paperBuildNumber}/downloads/paper-${paperServerVersion}-${paperBuildNumber}.jar -O /tmp/init.jar

cd /tmp
java -jar init.jar --initSettings 
cp versions/${paperServerVersion}/*.jar /tmp/server.jar
