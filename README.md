# Vagrant Chef Server-Client-Setup [DRAFT]

The repository contains a Vagrant configuration that provides a local chef server-client-setup.

## Requirement

* Ruby 2.1.0
* Vagrant 1.6.3
* Chef developement kit 0.2.1 (http://downloads.getchef.com/chef-dk/)


## Configuration

The setup is tested with Ubuntu 12.04 64Bit LTS on Mac OS X.
If you want to change the OS of your local vagrant boxes you have to edit the following lines in the Vagrantfile:
```
chef_server_config.vm.box = "hashicorp/precise64"
```

There are some preconfigured boxes available at https://vagrantcloud.com/.

## Installation

* Checkout repository
* Install Vagrant Omnibus https://github.com/schisamo/vagrant-omnibus
```
vagrant plugin install vagrant-omnibus
```
* Install Vagrant Berkshelf
```
install vagrant berkshelf
```