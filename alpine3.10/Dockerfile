## https://github.com/dperson/samba
## https://github.com/pwntr/samba-alpine-docker
#FROM stanback/alpine-samba
#FROM pwntr/samba-alpine
#FROM joebiellik/samba-server

FROM alpine:3.10

ENV USER_NAME=www-data
ENV USER_PASSWORD=www-data
ENV USER_GROUP=www-data
ENV USER_HOME=/var/www

RUN apk add --no-cache \
        samba-server \
        samba-common-tools

## Samba configuration
#RUN cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
COPY config/smb.conf /etc/samba/smb.conf

#VOLUME /var/www/html

## Initialize container
COPY config/entrypoint.sh /usr/local/bin/
RUN chmod u+x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

## Samba 135 for End Point Mapper [DCE/RPC Locator Service], 137, 138 for nmbd and 139, 445 for smbd
#EXPOSE 135/tcp 137/udp 138/udp 139/tcp 445/tcp
EXPOSE 445/tcp

CMD smbd -FS --no-process-group </dev/null
#CMD ["/bin/sh", "-c", "smbd -FS --no-process-group </dev/null"]
