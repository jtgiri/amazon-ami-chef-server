amazon-ami-chef-server
======================

Description
-----------

opscode's chef-server install seems to be missing amazon platform support mainly due to zlib-devel cookbook, therefore it fails the chef-server install on amazon AMI, this repo fixes that issue

Setup
-----
````
wget -O - https://raw.github.com/jtgiri/amazon-ami-chef-server/master/install.sh | bash
````
Test
----

In theory this should work fine on Centos as well, but I haven't tested it. 
