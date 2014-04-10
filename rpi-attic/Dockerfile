# bricewge/rpi-attic
# VERSION 0.2
# 
# BUILD-USING:	docker build -t bricewge/rpi-attic ./rpi-attic
# RUN-USING:	docker run -d -t -c 100 -m 50m -p 42423:22 -v /mnt/hdd/:/mnt/hdd/:rw -h attic --name attic bricewge/rpi-attic

FROM bricewge/rpi-base
MAINTAINER Brice Waegeneire, "https://bricewge.fr"

RUN apt-get -y -q install python3-pip python3-openssl

# Installing attic, it doesn't work via pip so we do it manualy
RUN curl -O https://pypi.python.org/packages/source/A/Attic/Attic-0.12.tar.gz
RUN tar -xvzf Attic-0.12.tar.gz
RUN cd Attic-0.12
RUN python3.2 setup.py install

# TODO put another ssh key file for attic software
EXPOSE 22

CMD ["/usr/bin/supervisord"]
