Vagrant.configure("2") do |config|
  #config.vm.box = "hashicorp-education/ubuntu-24-04"
  config.vm.box = "debian/bookworm64"
  config.vm.box_version = "12.20250126.1"

  # Bastion: 512MB RAM, 1 CPU, 10GB Disk, feste IP
  config.vm.define "bastion" do |bastion|
    bastion.vm.provision "shell", name: "common", path: "provision_jumphost.sh"
    bastion.vm.hostname = "bastion"
    bastion.vm.network "private_network", ip: "192.168.56.10"
    bastion.vm.provider "virtualbox" do |vb|
      vb.memory = 512
      vb.cpus = 1
      vb.customize ["createhd", "--filename", "bastion_disk.vdi", "--size", 10240]
      vb.customize ["storageattach", :id, "--storagectl", "SATA Controller",
                    "--port", 1, "--device", 0, "--type", "hdd", "--medium", "bastion_disk.vdi"]
    end
  end

  # Master: 2GB RAM, 1 CPU, 20GB Disk, feste IP
  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.56.11"
    master.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 1
      vb.customize ["createhd", "--filename", "master_disk.vdi", "--size", 20480]
      vb.customize ["storageattach", :id, "--storagectl", "SATA Controller",
                    "--port", 1, "--device", 0, "--type", "hdd", "--medium", "master_disk.vdi"]
    end
  end

  # Worker1: 2GB RAM, 1 CPU, 20GB Disk, feste IP
  config.vm.define "worker1" do |worker1|
    worker1.vm.hostname = "worker1"
    worker1.vm.network "private_network", ip: "192.168.56.12"
    worker1.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 1
      vb.customize ["createhd", "--filename", "worker1_disk.vdi", "--size", 20480]
      vb.customize ["storageattach", :id, "--storagectl", "SATA Controller",
                    "--port", 1, "--device", 0, "--type", "hdd", "--medium", "worker1_disk.vdi"]
    end
  end

  # Worker2: 2GB RAM, 1 CPU, 20GB Disk, feste IP
  config.vm.define "worker2" do |worker2|
    worker2.vm.hostname = "worker2"
    worker2.vm.network "private_network", ip: "192.168.56.13"
    worker2.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 1
      vb.customize ["createhd", "--filename", "worker2_disk.vdi", "--size", 20480]
      vb.customize ["storageattach", :id, "--storagectl", "SATA Controller",
                    "--port", 1, "--device", 0, "--type", "hdd", "--medium", "worker2_disk.vdi"]
    end
  end
end
