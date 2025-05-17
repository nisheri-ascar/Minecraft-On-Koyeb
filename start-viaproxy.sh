#!/bin/bash

echo "Starting viaproxy"
cd viaproxy
j9-java21 -jar ViaProxy.jar cli &
