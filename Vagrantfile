# encoding: utf-8
# -*- mode: ruby -*-
# # vi: set ft=ruby :

CONFIG= "config.rb"

$project_dir = "~/projects"

if File.exist?(CONFIG)
	require_relative CONFIG
end

Vagrant.configure("2") do |config|
  config.vm.box = "trusty-server-cloudimg-amd64-vagrant-disk1"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.synced_folder $project_dir, "/projects"
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
