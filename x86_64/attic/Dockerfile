FROM phusion/baseimage:0.9.11

MAINTAINER Brice Waegeneire, "https://bricewge.fr"

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

## Install an SSH privatekey.
ADD authorized_keys.pub /tmp/authorized_keys.pub
RUN cat /tmp/authorized_keys.pub >> /root/.ssh/authorized_keys && rm -f /tmp/authorized_keys.pub
# Set timezone
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

# Install attic
RUN apt-get update
RUN apt-get -y -q install python3-pip python3-openssl libssl-dev libacl1-dev
RUN pip3 install attic

# Configure attic user
RUN groupadd -g 502 attic
RUN useradd -g attic -m -u 502 -s /bin/bash attic
RUN passwd -d -u attic # Unlock the user
# Activate ssh login other than root
RUN rm /etc/nologin
ADD attic-user_ca.pub /etc/ssh/attic-user_ca.pub
RUN printf "AllowUsers root attic\nTrustedUserCAKeys /etc/ssh/attic-user_ca.pub" >> /etc/ssh/sshd_config

EXPOSE 22

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
