# bricewge/rpi-transmission
# VERSION 0.2
# 
# BUILD-USING:	docker build -t bricewge/rpi-transmission ./rpi-transmission
# RUN-USING:	docker run -d -c 100 -m 150m -p 9091:9091 -p 42421:22 -v 
/mnt/hdd/:/mnt/hdd/:rw -h transmission --name transmission bricewge/rpi-transmission

FROM bricewge/rpi-base
MAINTAINER Brice Waegeneire, "https://bricewge.fr"

RUN apt-get -y -q install transmission-daemon

# Configure transmission
## TODO use dotfiles
RUN rm /etc/transmission-daemon/settings.json
ADD settings.json /etc/transmission-daemon/settings.json
ADD foreground.sh /etc/transmission-daemon/foreground.sh
RUN chmod 755 /etc/transmission-daemon/foreground.sh

# Supervisor
RUN rm /etc/supervisor/conf.d/supervisord.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 9091 22

CMD ["/usr/bin/supervisord"]
