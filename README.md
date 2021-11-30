# Ansible playground using docker containers

I'm running this on AWS Amazon Linux 2 container, can't remember if I installed docker or it was there. 
I think the AL2 AMI I create with packer should work fine.

Ok so basically there is NO ansible here so far, but I've created an Ubuntu20 Ansible server
and an alpine based server image which can be the target of that ansible goodness.

I have a bridge network so the containers can talk, SSH from ansible master to the servers works. 
Basically I got a good to go playground


## Dockerfiles directory

Dir containing all the Dockerfiles. Instructions on builds are in there


## testenv

Scripts to start/stop the ansible environment

