
To Create a Marketing Guru Box.

Download and install Vagrant 1.6.4 and VirtualBox 4.3.10

To download Vagrant

wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.4_x86_64.deb

dpkg -i vagrant_1.6.4_x86_64.deb
vagrant -v 

To download VirtualBox
http://download.virtualbox.org/virtualbox/4.3.14/virtualbox-4.3_4.3.14-95030~Ubuntu~raring_amd64.deb

dpkg -i virtualbo… .deb

virtualbox -v



Create a MarketingGuru project folder

This Folder contains 
VagrantFile - config file for vagrant
MarketingGuru-v01.box - Centos box with few installed dependencies 
shared - folder which contains all the cookbooks for chef installation. 
	this folder gets mounted on the box PATH : /vagrant/

cd /MarketingGuru/shared
 
git clone https://github.com/pranavs-cuelogic/chef-cookbooks.git

this will create a chef-cookbooks folder in MarketingGuru/shared/

Copy the VagrantFile from /shared/chef-cookbooks/VagrantFile to MarketingGuru project folder.




Now we need to add the centos box to vagrant 
	sudo vagrant box add MarketingGuru-V01 MarketingGuru-V01.box
	we should run this command in the MarketingGuru folder. (where Vagrantfile is present)

you can check if the box is added or not 
	vagrant box list   
	check for MarketingGuru-V01 in the list.

Now we need to bring up the box
sudo vagrant up --provider=virtualbox

Once the box is up u need to ssh into the box.
	sudo vagrant ssh

Welcome to the centos box.
you will find the mounted /shared/chef-cookbooks in path /vagrant/chef-cookbooks

now you need to tell chef to install all the applications on this local machine.
	navigate to  /vagrant/chef-cookbooks/
    	and run this command. 
	sudo chef-solo -c solo.rb -j web.json

Currently the user is vagrant@vagrant ~]$ 

to check all the applications installed you need to switch vagrant super user
	Type su
	Password vagrant

Check all the applications installed by application_name -v

