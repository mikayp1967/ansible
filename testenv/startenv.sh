#!/bin/bash

docker network create -d bridge test-net
docker run -d --network=test-net --rm my-ansible 
