#!/bin/bash
# You can either add or comment to remove a flag for convenience

memory=350M
JAVA_FLAGS=(
  -Xms${memory}
  -Xmx${memory}
)

cd server
java "${JAVA_FLAGS[@]}" -jar server.jar
