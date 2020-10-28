FROM corebuild

# This image provides a Ruby 2.2 environment you can use to run your Ruby
# applications.

ENV RUBY_VERSION 2.6
ENV HTTPD_VERSION 2.4

RUN yum install -y --nogpgcheck rh-ruby27 rh-ruby27-ruby-devel rh-ruby27-rubygem-rake v8314 rh-ruby27-rubygem-bundler nodejs010 && \
    yum clean all -y

RUN chown -R 1001:0 /opt/app-root

EXPOSE 8080
USER 1001

ADD ./cmd.sh /

CMD ["/cmd.sh"]
