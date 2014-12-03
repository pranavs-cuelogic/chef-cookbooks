#
# Cookbook Name:: ngnx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "Nginx add repo" do
  command "rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm || true"
end

execute "Nginx install 1.6" do
    command "sudo yum -y install nginx16"
end

execute "stop nginx" do
    command "sudo service nginx stop"
end
