# bricewge/rpi-base
# VERSION 0.1
#
# BUILD-USING:	docker build -t bricewge/rpi-base .
# RUN-USING:	docker run -d -p 22 bricewge/rpi-base

FROM resin/rpi-raspbian:wheezy
MAINTAINER Brice Waegeneire, "https://bricewge.fr"


# Use the defaut source.list repository and be up-to-date
RUN echo "deb http://archive.raspbian.org/raspbian wheezy main contrib non-free" > /etc/apt/sources.list
RUN echo "deb-src http://archive.raspbian.org/raspbian wheezy main contrib non-free" >> /etc/apt/sources.list
RUN apt-get -y -q update && apt-get -y -q dist-upgrade
RUN apt-get -y -q install apt-utils locales nano git mr vcsh curl openssh-server sudo

# Use Paris time
RUN rm /etc/localtime
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime

# Set locales
RUN printf "en_US.UTF-8 UTF-8\nfr_FR.UTF-8 UTF-8\n" >> /etc/locale.gen
RUN printf "LANG=fr_FR.UTF-8" > /etc/default/locale
RUN locale-gen

# Use defalt root password
RUN echo "root:root" | chpasswd

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
# Configure user
RUN (HOME=/home/bricewge vcsh clone http://git.olivierdelort.net/bricewge/dotfiles-mr.git mr)
RUN mr up
RUN chown bricewge:users -R /home/bricewge


# Supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

## Cron
## TODO enable crontab to be update dotfiles config

EXPOSE 22

CMD ["/usr/bin/supervisord"]
