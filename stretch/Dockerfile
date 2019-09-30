FROM debian:stretch-slim

ENV USER_NAME=www-data
ENV USER_PASSWORD=www-data
ENV USER_GROUP=www-data
ENV USER_HOME=/var/www

RUN apt-get update \
&&  apt-get install -y --no-install-recommends \
        libcups2 \
        samba \
        samba-common \
        cups \
&&  rm -rf /var/lib/apt/lists/*

## Samba configuration
#RUN cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
COPY config/smb.conf /etc/samba/smb.conf

#VOLUME /var/www/html




## Set password
#RUN echo "USERNAME:NEWPASSWORD" | chpasswd USERNAME
RUN echo "www-data:www-data" | chpasswd www-data

## Create samba user
#RUN (echo ${USER_PASSWORD}; echo ${USER_PASSWORD}) | smbpasswd -s -a ${USER_NAME}
RUN (echo www-data; echo www-data) | smbpasswd -s -a www-data

#RUN usermod --shell /bin/bash ${USER_NAME}
RUN usermod --shell /bin/bash www-data

## Create home folder
RUN mkdir /var/www \
&&  chown www-data:www-data /var/www



## Create user without password, no shell (33 is the standard uid/gid for "www-data" in Debian)
#RUN addgroup -g 33 ${USER_GROUP} \
#&&  adduser -u 33 ${USER_NAME} -D -G ${USER_GROUP} -h ${USER_HOME} -s /bin/false \
## Create a samba user
#&&  echo -e "${USER_PASSWORD}\n${USER_PASSWORD}" | smbpasswd -s -a ${USER_NAME}

#RUN useradd ${USER_NAME} -p $(openssl passwd -1 ${USER_PASSWORD}) -m -s /bin/bash \
#RUN usermod --shell /bin/bash ${USER_NAME} \
#&&  (echo ${USER_PASSWD}; echo ${USER_PASSWD}) | smbpasswd -s -a ${USER_NAME} 1>/dev/null



## Rename existing system user www-data
#RUN usermod -l ${USER_NAME} -d ${USER_HOME} -m www-data \
#RUN usermod -l ${USER_NAME} www-data \
## Rename existing system group www-data
#&&  groupmod -n ${USER_GROUP} www-data \
## Add shell
#&&  usermod --shell /bin/bash ${USER_NAME}




## Initialize container
#COPY config/entrypoint.sh /usr/local/bin/
#RUN chmod u+x /usr/local/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]

## Samba 135 for End Point Mapper [DCE/RPC Locator Service], 137, 138 for nmbd and 139, 445 for smbd
#EXPOSE 135/tcp 137/udp 138/udp 139/tcp 445/tcp
EXPOSE 445/tcp

CMD smbd -FS --no-process-group </dev/null
#CMD ["/bin/sh", "-c", "smbd -FS --no-process-group </dev/null"]
#CMD [ "bash", "-c", "smbd -FS -d 2 < /dev/null" ]