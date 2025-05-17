#!/bin/bash

echo "Starting viaproxy"
cd viaproxy
j9-java8 -jar -Xms257M -Xmx257M ViaProxy.jar cli &
