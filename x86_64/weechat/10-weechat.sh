#!/bin/bash

PASSWD_T=${relaypasswd:-}
#USER_T=${weechatuser:-}

sed -i 's:\"password\":\"'"$relaypasswd"'\":g' /home/bricewge/.weechat/relay.conf
#sed -i 's:\"username\":\"'"$weechatUSER"'\":g' /path/to/the/file
