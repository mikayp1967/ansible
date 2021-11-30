# Docker build directory

Place all Dockerfiles in here as Dockerfile.<image_name>

## To build images:

    . ./docker-build-all.sh

This script will automatically detect any Dockerfiles that have changed (or new ones) 
and build a new image and tag it as latest.

To force a build edit OCI-vers and change/remove the 2nd field (file is csv).
To edit the version change the 3rd field. All new images will start at 0.1.0 and
versioning will update the minor version each build.

## ISSUES 

NO CHECKING FOR FAILED BUILDS YET - NEED TO DO THAT MAYBE...

