#!/bin/bash
# /etc/init.d/RepetierServer start
# service RepetierServer start

/bin/mkdir -p /var/lib/Repetier-Server
/bin/chown -R repetierserver /var/lib/Repetier-Server
/usr/local/Repetier-Server/bin/RepetierServer -c /usr/local/Repetier-Server/etc/RepetierServer.xml --daemon

exec "$@"
