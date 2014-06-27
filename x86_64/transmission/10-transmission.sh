#!/bin/bash

PASSWD_T=${PASSWD_T:-}
USER_T=${USER_T:-}
WHITELIST_T=${$WHITELIST_T:-}

transmission_settings=/etc/transmission-daemon/settings.json

sed -i 's:\"password\":\"'"$PASSWD_T"'\":g' $transmission_settings
sed -i 's:\"username\":\"'"$USER_T"'\":g' $transmission_settings
sed -i 's:\"127.0.0.1,192.168.1.*\":\"'"$WHITELIST_T"'\":g' $transmission_settings
