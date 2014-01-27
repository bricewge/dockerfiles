# bricewge/rpi-flexget
#
# VERSION 0.1

FROM bricewge/rpi-raspbian
MAINTAINER Brice Waegeneire, bricewge@gmail.com

USER flexget
WORKDIR /home/flexget

# Install flexget, transmission and their depedencies
## TODO Put wget in bricewge/rpi-raspbian
RUN apt-get -y install transmission-daemon python-transmissionrpc python python-pip python-dev
RUN pip install flexget

RUN useradd -m flexget


# Configure flexget
RUN mkdir /home/flexget/.flexget && wget https://raw2.github.com/bricewge/dotfiles-flexget/master/.config/flexget/config.yml -P /home/flexget/.flexget/ && chown flexget:flexget -R /home/flexget/.flexget


