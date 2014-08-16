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

# Install transmission
RUN apt-get update
RUN apt-get -y -q install transmission-daemon transmission-cli
# Configure the transmission user
RUN groupmod -g 501 debian-transmission
RUN usermod -u 501 debian-transmission
# Configure transmission
RUN mkdir /mnt/Torrents
RUN rm /etc/transmission-daemon/settings.json
ADD settings.json /etc/transmission-daemon/settings.json
RUN chown 501:501 -R /etc/transmission-daemon/

# Set the transmission daemon and the setup script
RUN mkdir /etc/service/transmission
ADD transmission.sh /etc/service/transmission/run
ADD 10-transmission.sh /etc/my_init.d/10-transmission.sh

# Set cron to update the blocklist daily
ADD cron.conf /tmp/cron.conf
RUN crontab /tmp/cron.conf

# Set variable environment
RUN echo "username" > /etc/container_environment/USER_T
RUN echo "password" > /etc/container_environment/PASSWD_T
RUN echo "127.0.0.1,192.168.1.\*" > /etc/container_environment/WHITELIST_T

EXPOSE 9091 22

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
