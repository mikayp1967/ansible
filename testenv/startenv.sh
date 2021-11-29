#!/bin/bash

docker network create -d bridge test-net
docker run -d --network=test-net --rm -v /home/ec2-user/repos/ansible/mountdir:/home/mgtuser/mountdir:  my-ansible 
