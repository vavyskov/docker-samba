#!/bin/sh
## Exit script if any command fails (non-zero status)
set -e




## Set password
#RUN echo "USERNAME:NEWPASSWORD" | chpasswd USERNAME
echo "www-data:www-data" | chpasswd www-data


## Create samba user
#RUN (echo ${USER_PASSWORD}; echo ${USER_PASSWORD}) | smbpasswd -s -a ${USER_NAME}
(echo www-data; echo www-data) | smbpasswd -s -a www-data


#RUN usermod --shell /bin/bash ${USER_NAME}
usermod --shell /bin/bash www-data





### Rename existing system user www-data
#usermod -l ${USER_NAME} -d ${USER_HOME} -m www-data
### Rename existing system group www-data
#groupmod -n ${USER_GROUP} www-data
### Add shell
#usermod --shell /bin/bash ${USER_NAME}
#
### Create samba user
###echo -e "${USER_PASSWORD}\n${USER_PASSWORD}" | smbpasswd -s -a ${USER_NAME} 1>/dev/null
#(echo ${USER_PASSWORD}; echo ${USER_PASSWORD}) | smbpasswd -s -a ${USER_NAME} 1>/dev/null








## Create user without password, no shell (33 is the standard uid/gid for "www-data" in Debian)



## Create user with password, shell (33 is the standard uid/gid for "www-data" in Debian)
#useradd --uid 33 --gid 33 dr -p $(openssl passwd -1 dr}) -d ${USER_HOME} -s /bin/bash



## Rename existing system user www-data
#usermod -l ${USER_NAME} -d ${USER_HOME} -m www-data

## Rename existing system group www-data
#groupmod -n ${USER_GROUP} www-data

## Create samba user
#echo -e "${USER_PASSWORD}\n${USER_PASSWORD}" | smbpasswd -s -a ${USER_NAME}





## Detect user
#if ! id ${USER_NAME}; then
#  echo -e "\nUser '${USER}' exists!\n"
#  exit
#fi


#userdel www-data
#addgroup --gid 33 ${USER_GROUP}
#useradd --uid 33 --gid 33 dr -p $(openssl passwd -1 dr) -d ${USER_HOME} -s /bin/bash



##useradd ${USER} -p $(openssl passwd -1 ${USER_PASSWD}) -m -s /bin/bash
#
#
### Create user without password, no shell (33 is the standard uid/gid for "www-data" in Debian)
#addgroup -g 33 ${USER_GROUP}
#adduser -u 33 ${USER_NAME} -D -G ${USER_GROUP} -h ${USER_HOME} -s /bin/false
### Create a samba user
#echo -e "${USER_PASSWORD}\n${USER_PASSWORD}" | smbpasswd -s -a ${USER_NAME}
#
## Create shared folder
#mkdir -p ${USER_HOME}/html
#chown -R ${USER_NAME}:${USER_GROUP} ${USER_HOME}

#exec smbd -FS --no-process-group </dev/null

## Make the entrypoint a pass through that then runs the docker command (redirect all input arguments)
exec "$@"
