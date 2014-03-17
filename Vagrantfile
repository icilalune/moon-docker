# encoding: utf-8
# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://dev.priv.icilalune.net/boxes/precise64.box"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.synced_folder "dockerfiles", "/dockerfiles"
  config.vm.synced_folder "<change_this>", "/projects"
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
