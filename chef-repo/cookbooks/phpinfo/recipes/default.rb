#
# Cookbook Name:: phpinfo
# Recipe:: default
#
# Copyright 2014, Christoph Gerold
#
# All rights reserved - Do Not Redistribute
#

  # remove index.html from desired path
file "#{node['phpinfo']['file_path']}index.html" do
  action :delete
end

  # add index.php to desired path
template "#{node['phpinfo']['file_path']}index.php" do
  source 'index.php.erb'
  action :create_if_missing
end