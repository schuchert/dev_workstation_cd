# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "boxcutter/ubuntu1604-desktop"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.omnibus.chef_version = "12.18.31"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
    v.customize ["modifyvm", :id, "--paravirtprovider", "legacy"]
    v.customize ["modifyvm", :id, "--memory", "6192"]
    v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    v.customize ["modifyvm", :id, "--cpus", "4"]
    v.customize ["modifyvm", :id, "--vram", "64"]
    v.customize ["modifyvm", :id, "--nestedpaging", "on"]
    v.customize ["modifyvm", :id, "--nictype1", "virtio"]
    v.customize ["modifyvm", :id, "--cableconnected1", "on"]
  end

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "fix_locale"
    chef.add_recipe "cf_cli"
    chef.add_recipe "apt"
    chef.add_recipe "vim"
    chef.add_recipe "git"
    chef.add_recipe "java"
    chef.add_recipe "maven" 
    chef.add_recipe "gradle" 
    chef.add_recipe "idea" 
    chef.add_recipe "gnome_keybindings"

    chef.json = {
      "java" => { 
        "set_etc_enviornment" => true,
        "install_flavor" => "oracle", 
        "jdk_version" => "8",
        "set_default" => true,
        "oracle" => { 
          "accept_oracle_download_terms" => true 
        } 
      }
    }
  end

end
