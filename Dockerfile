FROM resin/raspberrypi3-debian:latest
ENV INITSYSTEM on

RUN apt-get update \
    && apt-get install wget

RUN wget --output-document repetier-server.deb -q http://download.repetier.com/files/server/debian-armel/Repetier-Server-0.90.1-Linux.deb

RUN mkdir rebuild
RUN dpkg-deb --extract repetier-server.deb rebuild
RUN dpkg-deb --control repetier-server.deb rebuild/DEBIAN
COPY ./version91.1 rebuild/DEBIAN/postinst
RUN chmod 755 rebuild/DEBIAN/postinst
RUN chmod 755 rebuild/DEBIAN/prerm
RUN dpkg-deb --build rebuild

RUN dpkg -i rebuild.deb

RUN mkdir /var/lib/Repetier-Server/logs
RUN touch /var/lib/Repetier-Server/logs/server.log



COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 3344

ENTRYPOINT ["/entrypoint.sh"]

CMD tail -f /var/lib/Repetier-Server/logs/server.log