# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
OMNIBUS_CHEF_VERSION = :latest

# Define Chef Client Nodes
chef_client_nodes = [
	{
		:name => :node1,
		:ip => '192.168.32.102',
		:hostname => 'chef-node-1'
	},
	{
		:name => :node2,
		:ip => '192.168.33.103',
		:hostname => 'chef-node-2'
	},
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

		# Configure Chef Server
		# https://docs.vagrantup.com/v2/provisioning/chef_solo.html
	config.vm.define :chef_server, primary: true do |chef_server_config|
		chef_server_config.vm.box = "hashicorp/precise64"
		chef_server_config.vm.network "private_network", ip: "192.168.32.101"
		chef_server_config.vm.hostname = "chef-server"

		chef_server_config.vm.provision :chef_solo do |chef|
				# logging
			chef.log_level = :info
				# add recipes to run list
			chef.run_list = [
				"recipe[chef-server::default]"
			]

				# cookbook attributes
			chef.json = {
				"chef-server" => {
					"version" => "latest",
					"configuration" => {
						"chef_server_webui" => {
							"enable" => true
						}
					}
				}
			}
		end
	end

		# Configure Chef Client Nodes
		# https://docs.vagrantup.com/v2/provisioning/chef_client.html
	chef_client_nodes.each do |node_option|
		config.vm.define node_option[:name] do |node_config|
			node_config.vm.box = "hashicorp/precise64"
			node_config.vm.network "private_network", ip: node_option[:ip]
			node_config.vm.hostname = node_option[:hostname].to_s
		end
	end

		# General Virtual Box Configuration
	config.vm.provider "virtualbox" do |vb|
		vb.customize ['modifyvm', :id, '--memory', '768']
		vb.customize ['modifyvm', :id, '--cpus', '1']
		vb.gui = false
	end
end
