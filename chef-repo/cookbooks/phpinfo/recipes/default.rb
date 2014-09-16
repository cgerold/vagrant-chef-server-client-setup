#
# Cookbook Name:: phpinfo
# Recipe:: default
#
# Copyright 2014, Christoph Gerold
#
# All rights reserved - Do Not Redistribute
#

# remove index.html from document root

file '/var/www/index.html' do
	action :delete
end

# add index.php to document root
template "#{node['phpinfo']['file_path']}index.php" do
	source 'index.php.erb'
	action :create_if_missing
end