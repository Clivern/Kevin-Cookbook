#
# Cookbook:: kevin-cookbook
# Recipe:: mysql
#
# Copyright:: 2018, Clivern, All Rights Reserved.

log "recipe::mysql"

bash "Install MySQL Version #{node['mysql']['version']}" do
    code <<-EOH
        echo "mysql-server-#{node['mysql']['version']} mysql-server/root_password password #{node['mysql']['root_password']}" | sudo debconf-set-selections
        echo "mysql-server-#{node['mysql']['version']} mysql-server/root_password_again password #{node['mysql']['root_password']}" | sudo debconf-set-selections
        apt-get -y install mysql-server-#{node['mysql']['version']}
        service mysql restart
        apt-get -y install libmysqlclient-dev
    EOH
    only_if { node['mysql']['install'] }
end

execute "Create MySQL Database #{node['mysql']['db_name']}" do
    command "mysql -u root -p#{node['mysql']['root_password']} -e 'CREATE DATABASE IF NOT EXISTS #{node['mysql']['db_name']}'"
    live_stream true
    only_if { node['mysql']['create_db'] }
end