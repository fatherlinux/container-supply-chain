#!/bin/bash
# Run both in the background. Would love to just use systemd
/opt/rh/httpd24/root/sbin/httpd -DBACKGROUND 
/opt/rh/rh-php72/root/usr/sbin/php-fpm --nodaemonize

# Run in the foreground for testing
#/opt/rh/httpd24/root/sbin/httpd -DFOREGROUND && /opt/rh/rh-php56/root/usr/sbin/php-fpm --nodaemonize
