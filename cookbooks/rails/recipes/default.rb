#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



#gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3

execute "rails key" do
  command "curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -"
end

execute "rails" do
  command "curl -sSL https://get.rvm.io | bash -s stable --rails"
end
