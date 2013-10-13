# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.define "riakdev" do |riakdev|
    riakdev.vm.box = "precise64"
    riakdev.vm.box_url = "http://files.vagrantup.com/precise64.box"
    riakdev.vm.forward_port 10018, 10018
    riakdev.vm.host_name = "riakdev"
    riakdev.vm.provision :shell, :path => "provision.sh"
  end

end
