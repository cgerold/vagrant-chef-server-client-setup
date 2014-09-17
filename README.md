# Vagrant-Multi-Machine Chef Server-Client-Setup

## Preface

This repository contains a Vagrant Multi-Machine configuration that provides you a local Chef-Server-Client setup.
Furthermore it includes the needed files and configuration to install a executable LAMP-Stack via Chef Server on your Chef Client nodes:
* Ubuntu 12.04 64Bit LTS
* MySQL
* Apache2
* PHP5 (mod_php5)

The setups has been tested on Mac OS X. If you want to change the operation system of the local vagrant boxes you have to edit the following line in the Vagrantfile:
```
chef_server_config.vm.box = "hashicorp/precise64"
```
There are useful preconfigured boxes available at https://vagrantcloud.com/.

## Requirement

* VirtualBox
* Ruby 2.1.0
* Vagrant 1.6.3 (https://www.vagrantup.com/)
* Chef Development Kit 0.2.1 (http://downloads.getchef.com/chef-dk/)
* Chef Omnibus Installer (chef-client 11.14.6)
** Use this to install chef-client, berkshelf, knife and others on your local workstation
```
curl -L https://www.getchef.com/chef/install.sh | sudo bash
```

## Installation

* Checkout repository
* Install Vagrant Omnibus (https://github.com/schisamo/vagrant-omnibus)
```
$ vagrant plugin install vagrant-omnibus
```
* Install Vagrant Berkshelf (https://github.com/berkshelf/vagrant-berkshelf)
```
$ install vagrant berkshelf
```
* Install the required cookbooks
```
$ berks install
```
* Start your local machines (if you want to start a specific box append the name of it to the command)
```
$ vagrant up [NAME_OF_THE_BOX]
```

After the chef server is up and the service is running you can call the chef server gui by enter https://192.168.32.101 in your browser.
* Default user: admin
* Default password: p@ssw0rd1
You will be asked to change the default password.

## Configuration

* Copy the pem-keys to your local disk

This repository comes with a ready configured knife. You have to replace the content of the validation- and the user-pem file.
You can also create your own custom knife configuration from scratch (optional):
```
$ knife configure -i
```

* Copy the pem keys from the chef server to your local directory chef-repo/.chef/
```
$ vagrant ssh
$ cp /etc/chef/admin.pem /vagrant/chef-repo/.chef/
$ cp /etc/chef/chef-validator.pem /vagrant/chef-repo/.chef/
$ exit
```
* Change to the local directory chef-repo/
```
$ cd chef-repo/
```

* Check your config with
```
$ knife client list
chef-validator
chef-webui
```

* add the chef server ip to the hosts file of your node(s)
```
$ sudo vi /etc/hosts
192.168.32.101  chef-server.dev
```

* Bootstrap your node(s) (be sure your in the local directory chef-repo/)
```
$ knife bootstrap IP_OF_THE_NODE -x vagrant -P vagrant --sudo --node-name NODE_NAME
```

* Upload the chef webserver and node1 role
```
$ knife role from file chef-repo/roles/webserver.rb
$ knife role from file chef-repo/roles/node1.rb
```

* Open the node's definition file
```
$ knife node edit NODE_NAME
```

* Assign the node's role to the chef node (place the role within the run_list definition)
```
{
	"name": "NODE_NAME",
	"chef_environment": "_default",
	"normal": {
		"tags": []
	},
	"run_list": [
		"role[NODE_NAME]"
	]
}
```

* Install the cookbooks defined in the chef-repo/Berksfile including their dependencies via Berkshelf to you local disk
```
$ berks install
```

* Upload the cookbooks defined in the chef-repo/Berksfile including dependencies via Berkshelf to the chef server
```
$ berks upload --ssl-verify=false
```

* Run the chef-client on your node
```
$ vagrant ssh NODE_NAME
$ sudo chef-client
```