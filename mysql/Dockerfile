FROM corebuild
MAINTAINER docker@softwarecollections.org  
#RUN yum-config-manager --disable "*" --enable rhel-server-rhscl-7-rpms --enable rhel-7-server-optional-rpms
RUN yum-config-manager --enable rhel-server-rhscl-7-rpms --enable rhel-7-server-optional-rpms && \
    yum install -y --nogpgcheck --setopt=tsflags=nodocs rh-mysql57 && \
    yum clean all && \
    rm -rf /var/cache/yum/*
ADD ./enablerh-mysql57.sh /etc/profile.d/
EXPOSE 3306
CMD ["run-mysqld"]
