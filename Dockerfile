FROM resin/rpi-raspbian:latest

RUN apt-get update \
    && apt-get install wget\
    && apt-get install sysv-rc

RUN wget --output-document repetier-server.deb -q http://download.repetier.com/files/server/debian-armel/Repetier-Server-0.90.1-Linux.deb
RUN dpkg -i repetier-server.deb



# COPY entrypoint.sh /entrypoint.sh
# RUN chmod 755 /entrypoint.sh

EXPOSE 3344

# ENTRYPOINT ["/entrypoint.sh"]

# CMD tail -f /var/lib/Repetier-Server/logs/server.log
