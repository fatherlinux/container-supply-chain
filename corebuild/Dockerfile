FROM registry.access.redhat.com/ubi7/ubi
MAINTAINER fatherlinux <scott.mccarty@gmail.com>

ENV COREBUILD_VERSION 7.2

RUN yum install -y --setopt=tsflags=nodocs --nogpgcheck deltarpm iputils net-tools nmap-ncat tcpdump tar gnupg2 && \
    yum clean all && \
    rm -rf /var/cache/yum/*

COPY ./motd /etc/motd
RUN echo "cat /etc/motd" >> /etc/bashrc && \
    useradd -u 1001 -r -g 0 -m -d /opt/app-root -s /sbin/nologin -c "Default Application User" default && \
    chown -R 1001:0 /opt/app-root
