amazon-ami-chef-server
======================

Description
-----------

opscode's chef-server install seems to fail on amazon ami due to zlib-devel cookbook, I submitted a patch but it hasn't got accepted. In addtion, I've added a install.sh scripts which installs and configures chef-solo.
Setup
-----
````
wget -O - https://raw.github.com/jtgiri/amazon-ami-chef-server/master/install.sh | bash
````
Note
----

In theory this should work fine on Centos as well, but I haven't tested it. 
