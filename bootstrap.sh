#!/bin/sh

sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

apt-get update
apt-get install virtualbox-guest-utils lxc lxc-docker graphviz tmux linux-image-extra-`uname -r` -y

echo 'DOCKER_OPTS="-e native -s aufs"' >> /etc/default/docker

service docker restart

adduser vagrant docker

# get fig
curl -L https://github.com/orchardup/fig/releases/download/0.4.1/linux > /usr/local/bin/fig

# set it executable
chmod +x /usr/local/bin/fig
