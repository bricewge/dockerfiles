FROM phusion/baseimage:0.9.11

MAINTAINER Brice Waegeneire, "https://bricewge.fr"

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

## Install an SSH privatekey.
ADD authorized_keys.pub /tmp/authorized_keys.pub
RUN cat /tmp/authorized_keys.pub >> /root/.ssh/authorized_keys && rm -f /tmp/authorized_keys.pub

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

# Nginx-PHP Installation
RUN apt-get update
RUN apt-get install -y php5-sqlite php5-gd php5-fpm php5-intl nginx sqlite git 

RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/fpm/php.ini
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini

RUN mkdir           /var/www
ADD default         /etc/nginx/sites-available/default
RUN mkdir           /etc/service/nginx
ADD nginx.sh        /etc/service/nginx/run
RUN chmod +x        /etc/service/nginx/run
RUN mkdir           /etc/service/phpfpm
ADD phpfpm.sh       /etc/service/phpfpm/run
RUN chmod +x        /etc/service/phpfpm/run

# Install and configure COPS
RUN git clone https://github.com/seblucas/cops.git /var/www
RUN rm /var/www/config_local.php
ADD config_local.php /var/www/config_local.php

EXPOSE 80 22

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
