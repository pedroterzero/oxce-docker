#!/bin/bash
set -e

# Change uid and gid of node user so it matches ownership of current dir
if [ -n "$MAP_UID" ] && [ -n "$MAP_GID" ]; then
    export USER=oxce

    # echo "${USER} ---> UID = $MAP_UID / GID = $MAP_GID"


    usermod -u $MAP_UID ${USER} 2> /dev/null && {
      groupmod -g $MAP_GID ${USER} 2> /dev/null || usermod -a -G $MAP_GID ${USER}
    }

  # echo "**** GOSU ${USER} $@ ..."

  exec /usr/sbin/gosu ${USER} "$@"
else
  exec "$@"
fi
