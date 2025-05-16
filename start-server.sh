#!/bin/bash
# You can either add or comment to remove a flag for convenience

memory=350M
JAVA_FLAGS=(
  -Xms${memory}
  -Xmx${memory}
  -XX:+UnlockExperimentalVMOptions 
  -XX:+UseG1GC 
  -XX:G1NewSizePercent=20 
  -XX:G1ReservePercent=20 
  -XX:MaxGCPauseMillis=200
  -XX:G1HeapRegionSize=32M

)

cd server
java "${JAVA_FLAGS[@]}" -jar server.jar
