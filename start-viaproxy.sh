#!/bin/bash

echo "Starting viaproxy"
cd viaproxy
j9-java21 -jar -Xms260M -Xmx260M ViaProxy.jar cli &
