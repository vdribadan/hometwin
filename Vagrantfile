# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "central" do |central_config|
    central_config.vm.hostname = "central"
    central_config.vm.box = "centos7"
    central_config.vm.box_url = "https://atlas.hashicorp.com/vdribadan/boxes/centos7/versions/0.0.1/providers/virtualbox.box"
    central_config.vm.network "private_network", :ip => '10.10.10.3'
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook_central.yml"
    ansible.verbose = true
  end
  end

  config.vm.define "worker" do |worker_config|
    worker_config.vm.hostname = "worker"
    worker_config.vm.box = "centos7"
    worker_config.vm.box_url = "https://atlas.hashicorp.com/vdribadan/boxes/centos7/versions/0.0.1/providers/virtualbox.box"
    worker_config.vm.network "private_network", :ip => '10.10.10.2'
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook_worker.yml"
    ansible.verbose = true
  end
  end 
end
