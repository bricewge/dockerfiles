#!/bin/bash

# Set transmission host based on environement variable provided by docker
sed -i '/host:/c\      host: '$TRANS_PORT_9091_TCP_ADDR'' /home/flexget/config.yml

/usr/local/bin/flexget -c /home/flexget/config.yml daemon start
