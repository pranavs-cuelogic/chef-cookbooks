#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#





#execute "update" do
# command "yum install -y curl-devel sqlite-devel libyaml-devel libcurl-devel pcre-devel"
#end

#execute "passenger" do
# command "passenger-install-nginx-module --auto"
#end

#execute "mv nginx conf" do
# command  "mv /opt/nginx/conf/nginx.conf /opt/nginx/conf/bachupnginxconf"
#end

#template "/etc/rc.d/init.d/nginx" do
  #      source "nginx.erb"
  #      owner  "root"
 #       group  "root"
#        mode    755
#notifies :reload, 'service[nginx]'
#end

template "/opt/nginx/conf/nginx.conf" do
        source "conf.erb"
        owner  "root"
        group  "root"
        mode    644
#notifies :reload, 'service[nginx]'
end













#rvm_shell "passenger_module" do
#  ruby_string "ruby 2.1.5p273"
#  code        "passenger-install-nginx-module --auto"
# creates node[:passenger][:module_path]
#end
