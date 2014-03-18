#!/bin/bash

lxc-attach --name=`docker inspect $1 | grep "\"ID\"" | sed 's/^.*\: "\(.*\)".*$/\1/'`
