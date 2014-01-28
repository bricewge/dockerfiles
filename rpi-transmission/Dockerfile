# bricewge/rpi-transmission
# VERSION 0.1
# 
# BUILD-USING:	docker build -t bricewge/rpi-transmission .
# RUN-USING:	docker run  -p 9091:9091  -v /mnt/hdd/Torrents:/var/lib/transmission-daemon/downloads:rw -name transmission bricewge/rpi-transmission

FROM bricewge/rpi-raspbian
MAINTAINER Brice Waegeneire, "https://bricewge.fr"

RUN apt-get -y -q install transmission-daemon

# Configure transmission
## TODO use dotfiles
RUN rm /etc/transmission-daemon/settings.json
ADD settings.json /etc/transmission-daemon/settings.json

USER debian-transmission
EXPOSE 9091

CMD ["/usr/bin/transmission-daemon",  "--config-dir", "/etc/transmission-daemon/"]
