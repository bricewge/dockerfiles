# bricewge/rpi-raspbian
#
# VERSION 0.1

FROM resin/rpi-raspbian:wheezy
MAINTAINER Brice Waegeneire, "https://bricewge.fr"


# Use the defaut source.list repository and be up-to-date
RUN echo "deb http://archive.raspbian.org/raspbian wheezy main contrib non-free" > /etc/apt/sources.list
RUN echo "deb-src http://archive.raspbian.org/raspbian wheezy main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update 
RUN apt-get -y install apt-utils dialog 
RUN apt-get -y upgrade

# Use Paris time
RUN rm /etc/localtime
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime

# Install utilities and favorite software
RUN apt-get install -y nano git wget

## TODO Customize the image with my dotfiles and my favorite software
#RUN apt-get -y install vcsh mr emacs zsh
#RUN vcsh clone ssh://git@bricewge.fr:dotfiles/mr.git mr
#RUN mr up

## Cron
## TODO enable crontab to be update dotfiles config
