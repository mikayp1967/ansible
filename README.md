# Ansible playground usinh docker containers

## ansible-master

Dir containing the Dockerfile to create the ansible master "server" image

## ansible-client

Dir containing the Dockerfile to create the ansible client "server" images
Based on alpint:latest
SSHD is enabled to allow conection to mgtuser (id 1001) with the pub ssh key in ssh-files folder
DFver is a version file for docker image tagging
Build an inmage with:
	. ./dfwrapper.sh my-ansi-client


