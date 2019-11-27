# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.ssh.forward_agent = true

  #https://github.com/vagrant-libvirt/vagrant-libvirt/issues/796
  config.ssh.insert_key = false

  config.vm.synced_folder ".", "/vagrant", disabled: false

  config.vm.hostname = "vhcalnplci"

  #Requires plugin. Install by running: "vagrant plugin install vagrant-disksize"
  #You need at least 100GB available to install SAP
  #Average VM has 20GB
  config.disksize.size = '100GB'

  # Uses hashipcorp Ubuntu 18 LTS
	config.vm.box = "hashicorp/bionic64"

  # Forward netweaver ports
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 44300, host: 44300
  config.vm.network "forwarded_port", guest: 3300, host: 3300
  config.vm.network "forwarded_port", guest: 3200, host: 3200
 
  # Increase VM size to 6GB, or ASE database installation fails
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", "6144"]
    v.customize ["modifyvm", :id, "--name", "SAP Netweaver"]
  end
end
