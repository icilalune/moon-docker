#!/bin/sh

sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

apt-get update
apt-get install virtualbox-guest-utils lxc lxc-docker graphviz tmux -y

echo 'DOCKER_OPTS="-e lxc"' >> /etc/default/docker



