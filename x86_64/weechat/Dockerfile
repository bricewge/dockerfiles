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

# Install WeeChat
RUN add-apt-repository ppa:nesthib/weechat-stable
RUN apt-get update
RUN apt-get -y -q install weechat

# Configure WeeChat
#RUN rm /etc/transmission-daemon/settings.json
#ADD settings.json /etc/transmission-daemon/settings.json

RUN mkdir /etc/service/weechat
ADD weechat.sh /etc/service/weechat/run

#ADD 10-transmission.sh /etc/my_init.d/10-transmission.sh

EXPOSE 4001 22

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
