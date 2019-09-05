#!/bin/sh
## Exit script if any command fails (non-zero status)
set -e

## Create user without password, no shell (82 is the standard uid/gid for "www-data" in Alpine)
addgroup -g 82 ${USER_GROUP}
adduser -u 82 ${USER_NAME} -D -G ${USER_GROUP} -h ${USER_HOME} -s /bin/false
## Create a samba user
echo -e "${USER_PASSWORD}\n${USER_PASSWORD}" | smbpasswd -s -a ${USER_NAME}

## Create shared folder
#mkdir -p ${USER_HOME}/html
#chown -R ${USER_NAME}:${USER_GROUP} ${USER_HOME}

#exec smbd -FS --no-process-group </dev/null

## Make the entrypoint a pass through that then runs the docker command (redirect all input arguments)
exec "$@"
