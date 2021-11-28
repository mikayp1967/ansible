#!/bin/bash

# Spin up small test env for trying out some ansible

#


BASE_PORT=2200
cat /dev/null > server_list

function add_containers() {
# Create number of containers with specified name
# add_containers <num to add> <name prefix>
	for CLIENT in `seq 1 $1`
	do 
		BASE_PORT=$(( ${BASE_PORT} + 1 ))
		docker run -d --rm -p ${BASE_PORT}:22 --name $2_${CLIENT} --network=test-net my-ansi-client
		printf "$2_${CLIENT}\n" >> server_list
	done
}

add_containers 6 server_web
add_containers 2 server_app_auth
add_containers 3 server_app_order
add_containers 2 server_app_charge

