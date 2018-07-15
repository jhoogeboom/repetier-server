FROM resin/rpi-raspbian

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install wget

RUN wget --output-document repetier-server.deb -q http://download.repetier.com/files/server/debian-armel/Repetier-Server-0.70.1-Linux.deb
RUN dpkg -i repetier-server.deb

RUN touch /var/lib/Repetier-Server/logs/server.log

VOLUME /var/lib/Repetier-Server


COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 3344

ENTRYPOINT ["/entrypoint.sh"]

CMD tail -f /var/lib/Repetier-Server/logs/server.log
