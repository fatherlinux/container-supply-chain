FROM corebuild

# This image provides a Ruby 2.2 environment you can use to run your Ruby
# applications.

ENV RUBY_VERSION 2.2
ENV HTTPD_VERSION 2.4

RUN yum install -y --nogpgcheck centos-release-scl && \
    INSTALL_PKGS="rh-ruby27 rh-ruby27-ruby-devel rh-ruby27-rubygem-rake rh-ruby27-rubygem-bundler" && \
    yum install -y --nogpgcheck --setopt=tsflags=nodocs $INSTALL_PKGS && rpm -V $INSTALL_PKGS && \
    yum clean all -y

RUN chown -R 1001:0 /opt/app-root

EXPOSE 8080
USER 1001

ADD ./cmd.sh /

CMD ["/cmd.sh"]
