# bricewge/rpi-raspbian
#
# VERSION 0.1

FROM resin/rpi-raspbian:wheezy
MAINTAINER Brice Waegeneire, "https://bricewge.fr"


# Use the defaut source.list repository and be up-to-date
RUN echo "deb http://archive.raspbian.org/raspbian wheezy main contrib non-free" > /etc/apt/sources.list
RUN echo "deb-src http://archive.raspbian.org/raspbian wheezy main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update 
RUN apt-get -y -q install apt-utils locales nano git curl
RUN apt-get -y -q upgrade

# Use Paris time
RUN rm /etc/localtime
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime

# Set locales
RUN printf "en_US.UTF-8 UTF-8\nfr_FR.UTF-8 UTF-8\n" >> /etc/locale.gen
RUN printf "LANG=fr_FR.UTF-8" > /etc/default/locale
RUN locale-gen

# Use defalt root password
RUN echo "root:root" | chpasswd

## TODO Customize the image with my dotfiles and my favorite software
#RUN apt-get -y install vcsh mr emacs zsh
#RUN vcsh clone ssh://git@bricewge.fr:dotfiles/mr.git mr
#RUN mr up

## Cron
## TODO enable crontab to be update dotfiles config
