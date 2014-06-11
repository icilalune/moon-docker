#!/bin/bash

lxc-attach --name=`docker inspect $1 | grep "\"Id\"" | sed 's/^.*\: "\(.*\)".*$/\1/'`
