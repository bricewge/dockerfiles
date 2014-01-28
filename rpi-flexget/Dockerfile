# bricewge/rpi-flexget
# VERSION 0.1
#
# BUILD-USING:	docker build -t bricewge/rpi-flexget .
# RUN-USING:	docker run -d -link transmission:trans -name flexget bricewge/rpi-flexget

FROM bricewge/rpi-raspbian
MAINTAINER Brice Waegeneire, "https://bricewge.fr"

# Install flexget, transmission and their depedencies
RUN apt-get -y install python-transmissionrpc python python-pip python-dev
RUN pip install flexget

# Configure flexget
## TODO use dotfiles
RUN useradd -m flexget
ADD https://raw2.github.com/bricewge/dotfiles-flexget/master/.config/flexget/config.yml /home/flexget/
RUN chown flexget:flexget /home/flexget/config.yml

# Add startup script
ADD flexget.sh /home/flexget/
RUN chmod 755 /home/flexget/flexget.sh

USER flexget

CMD ["/bin/bash", "-e", "/home/flexget/flexget.sh"]
