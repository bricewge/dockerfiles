# bricewge/rpi-flexget
# VERSION 0.1
#
# BUILD-USING:	docker build -t bricewge/rpi-flexget .
# RUN-USING:	docker run -d -link transmission:trans -h flexget -name flexget bricewge/rpi-flexget

FROM bricewge/rpi-ssh
MAINTAINER Brice Waegeneire, "https://bricewge.fr"

# Install flexget, transmission and their depedencies
RUN apt-get -y install python-transmissionrpc python python-pip python-dev supervisor
RUN pip install flexget

# Configure flexget
## TODO use dotfiles
RUN useradd -m flexget
ADD https://git.olivierdelort.net/bricewge/dotfiles-flexget/raw/orgify/.config/flexget/config.yml
RUN chown flexget:flexget /home/flexget/config.yml

# Add startup script
ADD flexget.sh /home/flexget/
RUN chmod 755 /home/flexget/flexget.sh

# Supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22

CMD ["/usr/bin/supervisord"]
