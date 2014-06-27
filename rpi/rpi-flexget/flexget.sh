#!/bin/bash

# Set transmission host based on environement variable provided by docker
sed -i '/host:/c\      host: '$TRANS_PORT_9091_TCP_ADDR'' /home/bricewge/.config/flexget/config.yml

/usr/bin/sudo -u bricewge /usr/local/bin/flexget -c /home/bricewge/.config/flexget/config.yml daemon start
