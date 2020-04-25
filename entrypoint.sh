#!/bin/sh

USER_ID=${USER_ID:-9001}
GROUP_ID=${USER_ID:-9001}

echo "Starting with UID : $USER_ID, GID: $GROUP_ID"
useradd -u $USER_ID -o -m firefox
groupmod -g $GROUP_ID firefox
export HOME=/home/firefox

cp entrypoint.sh /home/firefox/
cp -r /profile /home/firefox/profile/

chown -R firefox:firefox /home/firefox/

ip=$(hostname --ip-address)

socat tcp-listen:2828,bind="$ip",fork tcp:127.0.0.1:2828 &

exec /usr/sbin/gosu firefox /usr/bin/firefox -headless -marionette -safe-mode -profile /home/firefox/profile/
