# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.ssh.forward_x11 = true
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"
    vb.cpus = "4"
  end
  config.vm.provision :shell, path: "VagrantBootOnce.sh"
  config.vm.provision :shell, privileged: false, path: "VagrantBootOnce-user.sh"
end

