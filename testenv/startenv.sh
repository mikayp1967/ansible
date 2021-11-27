#!/bin/bash

# Spin up small test env for trying out some ansible
#

# Eventually should add config like BASE_PORT, number, IMAGE etc from a config file or something

BASE_PORT=2200

for CLIENT in `seq 1 5`
do 
	PORT=$(( ${BASE_PORT} + ${CLIENT} ))
	docker run -d --rm -p ${PORT}:22 --name server_${CLIENT} my-ansi-client
done

# What the hell, lets do some "appservers"
BASE_PORT=2220
for CLIENT in `seq 1 4`
do 
	PORT=$(( ${BASE_PORT} + ${CLIENT} ))
	docker run -d --rm -p ${PORT}:22 --name app_server_${CLIENT} my-ansi-client
done


# Lets go crazy, lets do some "app2servers"
BASE_PORT=2240
for CLIENT in `seq 1 3`
do 
	PORT=$(( ${BASE_PORT} + ${CLIENT} ))
	docker run -d --rm -p ${PORT}:22 --name app2_server_${CLIENT} my-ansi-client
done

