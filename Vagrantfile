# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 8000, host: 8888
  
  # Upgrade Chef automatically
  config.omnibus.chef_version = :latest
  #config.vm.provision :shell, :inline => "gem install --no-ri --no-rdoc chef"
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w{cookbooks site-cookbooks}    
    chef.add_recipe "postgresql::server_debian"
    chef.add_recipe "postgresql::ruby"
    chef.add_recipe "git"
    chef.add_recipe "python"
    chef.add_recipe "python::source"
    chef.add_recipe "gswd"
    chef.add_recipe "gswd::database"
    chef.json = {
      :postgresql => {
        :password => {:postgres => "gswd"},
        :version => 9.3
      }
    }
  end
end
