#!/bin/bash
#

# Delete all containers started for this project

for CONT in `docker ps|grep server_|awk '{print $1}'`
do
    docker stop ${CONT} &>/dev/null &
done


# Stopped all containers in background so they go concurrently
# Now I need to wait til they are no longer running

CRUN=99
while [ "${CRUN}" -gt "0" ]; do
    CRUN=$(docker ps|grep server_|wc -l)
    printf "Containers running: ${CRUN}  \r"
done
printf "ALL containers stopped\n\n"
