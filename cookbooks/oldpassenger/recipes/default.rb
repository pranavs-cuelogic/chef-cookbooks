#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#





#bash "install hubot" do
#  user "root"
#  group "root"
#  code <<-EOH 
#     gem install passenger
# EOH
#end

execute "passenger" do
 command "gem install passenger"
end

#execute "update" do
# command "yum install -y curl-devel sqlite-devel libyaml-devel"
#end

#execute "passenger" do
# command "passenger-install-nginx-module --auto"
#end


#template "/etc/rc.d/init.d/nginx" do
#        source "nginx.erb"
#        owner  "root"
#        group  "root"
#        mode    755
#notifies :reload, 'service[nginx]'
#end


##############################################################
#gem_package 'passenger' do
#    version '4.0.55'
#    #gem_binary '/usr/local/rvm/gems/ruby-2.1.5/bin'
#    #options '--no-ri --no-rdoc'
#  action :install
#end

#gem_package "passenger" do
#        package_name "passenger"
#        version "4.0.56"
#        # gem_binary "/usr/local/rvm/gems/ruby-2.1.5"
#        options "--no-ri --no-rdoc"
#  end













#rvm_shell "passenger_module" do
#  ruby_string "ruby 2.1.5p273"
#  code        "passenger-install-nginx-module --auto"
# creates node[:passenger][:module_path]
#end
