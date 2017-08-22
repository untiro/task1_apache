#
# Cookbook:: task1_apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'httpd'

package 'php' do
  action :install
end

file '/var/www/html/index.php' do
  content "<?php\n phpinfo(); \n?>"
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
end

service 'httpd' do
  action [ :enable, :start ]
  supports :reload => true
end
