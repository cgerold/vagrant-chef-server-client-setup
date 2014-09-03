# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
OMNIBUS_CHEF_VERSION = :latest

# Define chef Client Nodes
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

		# Chef Server
	config.vm.define :chef_server, primary: true do |chef_server_config|
		chef_server_config.vm.box = "hashicorp/precise64"
		chef_server_config.vm.network "private_network", ip: "192.168.32.101"
		chef_server_config.vm.hostname = "chef-server"
		chef_server_config.omnibus.chef_version = OMNIBUS_CHEF_VERSION

		chef_config.vm.provision :chef_solo do |chef|
			chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
			chef.roles_path = "roles"
			chef.data_bags_path = "data_bags"
			chef.provisioning_path = guest_cache_path
				# logging
			chef.log_level = :info
			chef.run_list = [
				"recipe[chef-server::default]"
			]
		end
	end

		# Chef Client Nodes
	chef_client_nodes.each do |node_option|
		config.vm.define node_option[:name] do |node_config|
			node_config.vm.box = "hashicorp/precise64"
			node_config.vm.network "private_network", ip: node_option[:ip]
			node_config.vm.hostname = node_option[:hostname].to_s
		end
	end

		# Virtual Box Configuration
	config.vm.provider "virtualbox" do |vb|
		vb.customize ['modifyvm', :id, '--memory', '512']
		vb.customize ['modifyvm', :id, '--cpus', '1']
		vb.gui = false
	end
end
