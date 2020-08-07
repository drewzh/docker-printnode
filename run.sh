#!/bin/bash

set -e
set -x

if [ $(grep -ci $CUPS_USER /etc/shadow) -eq 0 ]; then
    useradd -m -G lpadmin -s /usr/sbin/nologin $CUPS_USER
fi

echo $CUPS_USER:$CUPS_PASSWORD | chpasswd

/usr/sbin/avahi-daemon --daemonize
/usr/sbin/cupsd

exec /usr/local/PrintNode/PrintNode \
    --headless \
    --web-interface \
    --remove-scales-support \
    --use-enviroment-variables
