# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "bento/centos-7.4"

  config.vm.network "forwarded_port", guest: 22, host: 20071, host_ip: "127.0.0.1", id: "ssh"
  config.vm.network "forwarded_port", guest: 80, host: 8070,  host_ip: "127.0.0.1", id: "http"

  config.vm.network :private_network, ip: "192.168.33.55"

  config.vm.synced_folder ".", "/vagrant", owner: "apache", group: "apache", mount_options: ["uid=48", "gid=48", "dmode=755", "fmode=777"]

  config.vm.provision "shell", inline: <<-SHELL
    /vagrant/setting/local/bin/provision.sh
  SHELL

  # always run shell
  config.vm.provision "shell", run: "always", inline: <<-SHELL
    /vagrant/setting/local/bin/provision_always.sh
  SHELL

  # timezone
  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = "Asia/Tokyo"
  end
end
