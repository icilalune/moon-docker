#!/bin/sh

sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

apt-get update
apt-get install linux-image-generic-lts-raring linux-headers-generic-lts-raring -y
apt-get install virtualbox-guest-dkms -y
apt-get install lxc-docker -y



