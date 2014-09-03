# Vagrant-Multi-Machine Chef Server-Client-Setup [DRAFT]

The repository contains a Vagrant-Multi-Machine configuration that provides a local chef server-client-setup.
The setup is tested with Ubuntu 12.04 64Bit LTS on Mac OS X.
If you want to change the OS of the local vagrant boxes you have to edit the following lines in the Vagrantfile:
```
chef_server_config.vm.box = "hashicorp/precise64"
```
There are useful preconfigured boxes available at https://vagrantcloud.com/.

I use chef-solo to install chef-server

## Requirement

* VirtualBox
* Ruby 2.1.0
* Vagrant 1.6.3 (https://www.vagrantup.com/)
* Chef Development Kit 0.2.1 (http://downloads.getchef.com/chef-dk/)

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
* Start your local nodes (if you want to start a specific box add the name to the command)
```
vagrant up [NAME_OF_THE_BOX]
```
* Install the cookbook local
```
berks install
```


