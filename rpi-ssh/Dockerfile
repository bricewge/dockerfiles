# bricewge/rpi-ssh
# VERSION 0.1
#
# BUILD-USING:	docker build -t bricewge/rpi-ssh .
# RUN-USING:	docker run -d -p 22 -name ssh bricewge/rpi-ssh

FROM bricewge/rpi-raspbian
MAINTAINER Brice Waegeneire, "https://bricewge.fr"


# Install sshd and sudo 
RUN apt-get -y -q install openssh-server sudo
# Configure sshd
RUN mv /etc/ssh/sshd_config /etc/ssh/sshd_config.old
ADD sshd_config /etc/ssh/
RUN chown root:root /etc/ssh/sshd_config
RUN mkdir /var/run/sshd
# Configure sudo to be used without password
RUN sed -i '/%sudo/c\%sudo ALL=(ALL) NOPASSWD: ALL' /etc/sudoers

# Create user
RUN useradd -m -s /bin/bash -G "users,ssh,sudo" bricewge
RUN mkdir /home/bricewge/.ssh
RUN echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDT5fzsASMTCqeFuB4IcNzillPec7yQa7Kpq8KJiMQvv0xOHV7/Ha1gYHO6mjEFu5iILMnmKepvIP/dasQbZCw0v8LY49XDC+CL9qCCGmfwwXA9FNlu4sYkzXq5l6k8RLisCopbQTCoQxaKd/N5EDGDj6bXHiOYAIjl6HqbCh8+QaHcXwsuHTSb7MezTkkZBAPSj+YJfTQto4Q46aCY5f2grNXq5UCNrJ8nqR260/iDrnqm9uTr6ipllCp+KhZXxSIF9hl8X/J3TkXx73lnx3nPgcMESqkbeKVXF83LNZE5JrdBr1QT1FghDi6GKIFqfk/4x4kOEOvAjcteVfdQ3V1b cardno:000000000001 > /home/bricewge/.ssh/authorized_keys
RUN chown bricewge:users -R /home/bricewge

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
