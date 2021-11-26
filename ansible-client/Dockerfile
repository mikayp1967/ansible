FROM alpine:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apk add net-tools openssh openssh-server && /usr/bin/ssh-keygen -A

RUN addgroup -g 1001 mgtgroup && \
     adduser -u 1001 -G mgtgroup -D -h /home/mgtuser -s /bin/sh mgtuser
RUN mkdir /home/mgtuser/.ssh && chmod 700 /home/mgtuser/.ssh 

COPY ./ssh-files /home/mgtuser/.ssh

RUN chmod 600 /home/mgtuser/.ssh/* && chown mgtuser:mgtgroup -R /home/mgtuser/.ssh && \
    sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#PubkeyAuthentication/PubkeyAuthentication/' /etc/ssh/sshd_config && \
    sed -i 's/^#HostKey/HostKey/' /etc/ssh/sshd_config && \
    echo "RSAAuthentication yes" >> /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-o", "ListenAddress=0.0.0.0"]
