#!/bin/bash
#
# Update version of image (stored in DFver)
# Tag built image as latest
# $1 = Image name

if [ $1 == "" ]; then
    printf "Please supply build name as parameter\n"  
    exit 1
fi


if [ ! -s ./DFver ] ; then
    printf "0.1.0" > ./DFver
fi

VERS=$(cat DFver|awk -F\. '{print $1"."$2}')
MINOR=$(cat DFver|awk -F\. '{print $3 +1}')

printf "New version: ${VERS}.${MINOR}\n"
printf "${VERS}.${MINOR}" > ./DFver

docker build -t $1:${VERS}.${MINOR} .
docker tag  $1:${VERS}.${MINOR} $1:latest
