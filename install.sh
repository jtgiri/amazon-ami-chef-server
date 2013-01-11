rpm -Uvh http://rbel.frameos.org/rbel6
yum -y install ruby ruby-devel ruby-ri ruby-rdoc ruby-shadow gcc gcc-c++ automake autoconf make curl dmidecode
cd /usr/local/src
wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.10.tgz
tar zxf rubygems-1.8.10.tgz
cd rubygems-1.8.10
ruby setup.rb --no-format-executable
gem install chef
sudo mkdir /etc/chef/
cat << EOF > /etc/chef/solo.rb 
file_cache_path "/tmp/chef-solo"
cookbook_path "/tmp/chef-solo/cookbooks/"
EOF
cat << EOF > ~/chef.json
{
  "chef_server": {
    "server_url": "http://localhost:4000",
    "webui_enabled": true
  },
  "run_list": [ "recipe[chef-server::rubygems-install]" ]
}
EOF
wget -O - https://github.com/jtgiri/amazon-ami-chef-server/archive/master.tar.gz | tar -xzv
mkdir -p /tmp/chef-solo
mv amazon-ami-chef-server-master/cookbooks /tmp/chef-solo/cookbooks
sudo chef-solo  -j ~/chef.json
echo "/usr/local/lib" >> /etc/ld.so.conf
ldconfig
for service in  chef-server server-webui chef-solr chef-expander couchdb ; do service $service restart ; done
