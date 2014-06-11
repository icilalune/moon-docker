
# Add docker.io APT repository
sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

# Install docker & kernel additions
apt-get install lxc lxc-docker graphviz tmux linux-image-extra-`uname -r` -y

# Alter docker default options to use LXC engine & AUFS storage
echo 'DOCKER_OPTS="-e lxc -s aufs"' >> /etc/default/docker
