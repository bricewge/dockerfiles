# bricewge/rpi-flexget
# VERSION 0.2
#
# BUILD-USING:	docker build -t bricewge/rpi-flexget ./rpi-flexget
# RUN-USING:	docker run -d -c 100 -m 50m -p 42422:22 -v /mnt/hdd/:/mnt/hdd/:rw --link transmission:trans -h flexget --name flexget bricewge/rpi-flexget

FROM bricewge/rpi-base
MAINTAINER Brice Waegeneire, "https://bricewge.fr"

# Install flexget, transmission and their depedencies
RUN apt-get -yq install python-transmissionrpc python2.7 python-pip python2.7-dev
RUN pip install flexget

# Add startup script
ADD flexget.sh /home/bricewge/
RUN chmod 755 /home/bricewge/flexget.sh

# Supervisor
RUN rm /etc/supervisor/conf.d/supervisord.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22

CMD ["/usr/bin/supervisord"]
