#!/bin/bash

#lxc-attach --name=`docker inspect $1 | grep "\"Id\"" | sed 's/^.*\: "\(.*\)".*$/\1/'` $2

container_name=$1
shift
nsenter --target `docker inspect --format {{.State.Pid}} $container_name` --mount --uts --ipc --net --pid -- $*
