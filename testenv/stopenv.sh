#!/bin/bash
#

# Delete all containers started for this project

for CONT in `docker ps|grep server_|awk '{print $1}'`
do
    docker stop ${CONT}
done

