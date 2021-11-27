# Ansible testing "stuff"

## startenv.sh

This script will start a number of ansible client containers
with sshd and not much else configured.

Could prob use improvement to get some config from a file maybe
for now you have to edit the script to chang it

Usage:
    . ./startenv.sh

## stopenv.sh

This script will delete all containers created with the previous script

Usage:
    . ./stopenv.sh
