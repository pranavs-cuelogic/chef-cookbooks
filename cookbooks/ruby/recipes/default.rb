execute "yum groupinstall -y 'Development Tools'" do 
  action :run
end

packages = [
  "ruby",
  "ruby-devel",
  "ruby-irb",
  "ruby-libs",
  "ruby-rdoc",
  "rubygems"
]

# Remove the default Ruby 1.8.7
packages.each do |package|
    yum_package package do
        action :remove
    end
end

# Store source files here
source_directory = '/usr/local/src'

#############################################
# Install libyaml which is needed by gem
#############################################

# Check: http://pyyaml.org/download/libyaml for the latest version.
libyaml_version = 'yaml-0.1.5'

# Download libyaml source
remote_file "#{source_directory}/#{libyaml_version}.tar.gz" do
  source "http://pyyaml.org/download/libyaml/#{libyaml_version}.tar.gz"
end

# Extract the source
execute "tar xzvf #{libyaml_version}.tar.gz" do
  cwd source_directory 
  action :run
end

# Configure source for compiling
execute "./configure --prefix=/usr/local" do
  cwd "#{source_directory}/#{libyaml_version}" 
  action :run
end

# Compile libyaml
execute "make" do
  cwd "#{source_directory}/#{libyaml_version}" 
  action :run
end

# Now install it
execute "make install" do
  cwd "#{source_directory}/#{libyaml_version}" 
  action :run
end

# Delete the tarball. Keep the source just in case.
file "#{source_directory}/#{libyaml_version}.tar.gz" do
  action :delete
end

#############################################
# Install Ruby version 2.1.2
#############################################

# Check: https://www.ruby-lang.org/en/downloads/ for the latest version.
ruby_version = 'ruby-2.1.2'

# Download Ruby source
remote_file "#{source_directory}/#{ruby_version}.tar.gz" do
  source "http://cache.ruby-lang.org/pub/ruby/#{ruby_version}.tar.gz"
end

# Extract the source
execute "tar xzvf #{ruby_version}.tar.gz" do
  cwd source_directory 
  action :run
end

# Configure source for compiling. Set libraries paths and skip doc install.
execute "./configure --prefix=/usr/local --disable-install-doc --with-opt-dir=/usr/local/lib" do
  cwd "#{source_directory}/#{ruby_version}" 
  action :run
end

# Compile it
execute "make" do
  cwd "#{source_directory}/#{ruby_version}" 
  action :run
end

# Now install it
execute "make install" do
  cwd "#{source_directory}/#{ruby_version}" 
  action :run
end

# Delete the tarball. Keep the source just in case.
file "#{source_directory}/#{ruby_version}.tar.gz" do
  action :delete
end

#################################################
# Test install
#
# ruby -v should show 'ruby-1.9.3-p484' or
# the same name you enter for ruby_version above.
# 
# If it doesn't then reboot and it should. I would
# add a reboot step here but I don't know how to 
# do this with Chef.
#################################################

#############################################
# Install gem and Chef related packages
#############################################

# Update gem
execute "gem update --system" do
  action :run
end

gems = [
  "rubocop",
 # "foodcritic",
  "serverspec",
 # "rpsec",
  "bundle",
  "rake"
 # "berkshelf"
]

# Install useful Ruby gems for Chef
gems.each do |package|
    gem_package package do
        action :install
    end
end
