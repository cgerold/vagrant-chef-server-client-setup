# Vagrant-Multi-Machine Chef Server-Client-Setup [DRAFT]

The repository contains a Vagrant-Multi-Machine configuration that provides a local chef server-client-setup.
The setup is tested with Ubuntu 12.04 64Bit LTS on Mac OS X.
If you want to change the OS of the local vagrant boxes you have to edit the following lines in the Vagrantfile:
```
chef_server_config.vm.box = "hashicorp/precise64"
```
There are useful preconfigured boxes available at https://vagrantcloud.com/.

## Requirement

* VirtualBox
* Ruby 2.1.0
* Vagrant 1.6.3 (https://www.vagrantup.com/)
* Chef Development Kit 0.2.1 (http://downloads.getchef.com/chef-dk/)
* Chef Omnibus Installer
** Use this to install chef-client, berkshelf, knife and others on your local workstation
```
curl -L https://www.getchef.com/chef/install.sh | sudo bash
```

## Configuration

* chef-server
* chef-client

## Installation

* Checkout repository
* Install Vagrant Omnibus (https://github.com/schisamo/vagrant-omnibus)
```
vagrant plugin install vagrant-omnibus
```
* Install Vagrant Berkshelf (https://github.com/berkshelf/vagrant-berkshelf)
```
install vagrant berkshelf
```
* Install the needed cookbooks
```
berks install
```
* Start your local nodes (if you want to start a specific box append the name of it to the command)
```
vagrant up [NAME_OF_THE_BOX]
```


