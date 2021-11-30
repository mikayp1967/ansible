#!/bin/bash
#
# New script to build all Dockerfile.xxx in the current directory
# The part after the . will be the image name
# Grab versioning from local repo
#


# First off get a list of Dockerfiles, check if they are all in the local version file if not add them
# I will add md5s to track changes

if [ ! -f ./OCI-vers ]; then
    touch ./OCI-vers
fi

ls -1 Dockerfile.* |sed 's/Dockerfile.//'|sort > /tmp/OCI-vers.new
cat ./OCI-vers|awk -F, '{print $1}' > /tmp/OCI-vers.old
comm -13 /tmp/OCI-vers.old /tmp/OCI-vers.new > /tmp/OCI-vers.add

if [ -s /tmp/OCI-vers.add ] ; then
    sed -i 's/$/,XXXXXX,0.1.0/' /tmp/OCI-vers.add
    cat /tmp/OCI-vers.add >> ./OCI-vers
    sort -o ./OCI-vers ./OCI-vers
fi

# Test each image in the file, see if md5 matches
ALL_IM=$(cat OCI-vers|awk -F, '{print $1}')
for IM in ${ALL_IM}
do
    OLD_MD5=$(grep "^${IM}," OCI-vers|awk -F, '{print $2}')
    OLD_VER=$(grep "^${IM}," OCI-vers|awk -F, '{print $3}')
    NEW_MD5=$(cat Dockerfile.${IM}|md5sum|awk '{print $1}')
    printf "Image: ${IM} \t OLD: ${OLD_MD5}  \tNEW: ${NEW_MD5}\n"
    if [ "${OLD_MD5}" != "${NEW_MD5}" ]; then
        VERS=$(echo ${OLD_VER}| awk -F\. '{print $1"."$2}')
        MINOR=$(echo ${OLD_VER}|awk -F\. '{print $3 +1}')
        printf "Rebuilding Image: ${IM} \t OLD: ${OLD_MD5}  \tNEW: ${NEW_MD5}\n"
        docker build -t ${IM}:${VERS}.${MINOR} -f "Dockerfile.${IM}" .
        docker tag  ${IM}:${VERS}.${MINOR} ${IM}:latest
        sed -i "s/^${IM},.*/${IM},${NEW_MD5},${VERS}.${MINOR}/" ./OCI-vers
    fi
done



