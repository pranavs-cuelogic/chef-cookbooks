#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "Nginx add repo" do
  command "rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm || true"
end

package 'nginx16' do
    action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

cookbook_file "/usr/share/nginx/html/index.html" do
  source "index.html"
  mode "0644"
end

template "/etc/nginx/sites-available/default" do
 	source "default-site.erb"
	owner  "root"
	group  "root"
	mode  	00644
notifies :reload, 'service[nginx]'
end
