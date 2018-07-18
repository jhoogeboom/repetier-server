#!/bin/bash
# /etc/init.d/RepetierServer start
rm /etc/init.d/RepetierServer
chmod 644 /lib/systemd/system/RepetierServer.service
systemctl --system daemon-reload
systemctl enable RepetierServer.service
service RepetierServer start

# /bin/mkdir -p /var/lib/Repetier-Server
# /bin/chown -R repetierserver /var/lib/Repetier-Server
# /usr/local/Repetier-Server/bin/RepetierServer -c /usr/local/Repetier-Server/etc/RepetierServer.xml --daemon

exec "$@"
