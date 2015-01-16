name "development"
description "A role to configure our front-line web servers"
run_list  "recipe[yum]", "recipe[yum-epel]", "recipe[apt]", "recipe[build-essential]", "recipe[ohai]", "recipe[runit]", "recipe[cpu]", "recipe[install_from]", 
"recipe[metachef]", "recipe[openssl]", "recipe[chef-sugar]", "recipe[rails]" 

