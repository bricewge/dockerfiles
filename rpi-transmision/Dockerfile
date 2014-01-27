# bricewge/rpi-transmission
#
# VERSION 0.1

FROM bricewge/rpi-raspbian
MAINTAINER Brice Waegeneire, "https://bricewge.fr"

RUN apt-get -y -q install transmission-daemon

# Configure transmission
## TODO use dotfiles
RUN rm /etc/transmission-daemon/settings.json
ADD settings.json /etc/transmission-daemon/settings.json

EXPOSE 9091

CMD ["/usr/bin/transmission-daemon", "-f"]
