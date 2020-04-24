#!/bin/sh


if [ -z "$USER_ID" ]; then
usermod -u $USER_ID -o -m firefox
fi
if [ -z "$GROUP_ID" ]; then
groupmod -g $GROUP_ID firefox
fi

ip=$(hostname --ip-address)

socat tcp-listen:2828,bind="$ip",fork tcp:127.0.0.1:2828 &

/usr/bin/firefox -headless -marionette -safe-mode -profile /home/firefox/profile/
