#!/bin/bash

main(){
	echo Started at: $(date)
	echo Variables set: \
		SERVER_FLAVOR: $SERVER_FLAVOR \
		paperServerVersion: $paperBuildVersion \
		paperBuildNumber: $paperBuildNumber

	./webserve.sh
	./setup-common.sh && echo "Setup complete!"
	./playit.sh &
	./start-server.sh 
}


main 2>&1 | tee -a ./server.log

