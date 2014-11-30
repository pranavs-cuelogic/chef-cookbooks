#
# Cookbook Name:: ngnx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'nginx' do
  action :install
end
service 'nginx' do
  action [ :enable, :start ]
end
cookbook_file "/usr/share/nginx/www/index.html" do
  source "index.html"
  mode "0644"
end
execute "ails" do
  command "mv /etc/nginx/sites-available/default /etc/nginx/sites-available/backupdefault"
end
