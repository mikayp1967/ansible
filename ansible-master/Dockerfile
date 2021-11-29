FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
  apt install -y ansible jq net-tools iputils-ping 

# Create user. Leave locked, just allow exec in to the pod then su
RUN groupadd -g 1001 mgtgroup && \
    useradd -u 1001 -G mgtgroup  -d /home/mgtuser -m -s /usr/bin/bash mgtuser && \
    mkdir /home/mgtuser/.ssh && chmod 700 /home/mgtuser/.ssh && \
    echo "umask 0000" >> ~mgtuser/.profile 

COPY ./ssh-files /home/mgtuser/.ssh

RUN chmod 600 /home/mgtuser/.ssh/* && chown mgtuser:mgtgroup -R /home/mgtuser/.ssh 

# Random command to stop it exiting
CMD ["tail", "-f", "/dev/null"]

