#
# Cookbook:: kevin-cookbook
# Recipe:: package
#
# Copyright:: 2018, Clivern, All Rights Reserved.

log "recipe::package"

node['package']['required'].each do |package|
    log "Installing Package #{package}"
    package "#{package}" do
        action :install
        only_if { node['package']['install_required'] }
    end
end

node['package']['install'].each do |package|
    log "Installing Package #{package}"
    package "#{package}" do
        action :install
    end
end

node['package']['upgrade'].each do |package|
    log "Upgrading Package #{package}"
    package "#{package}" do
        action :upgrade
    end
end

node['package']['remove'].each do |package|
    log "Removing Package #{package}"
    package "#{package}" do
        action :remove
    end
end

node['package']['purge'].each do |package|
    log "Purging Package #{package}"
    package "#{package}" do
        action :purge
    end
end

node['package']['pip_install'].each do |package|
    log "Installing Python Package #{package}"
    execute "pip#{node['python']['version']} install #{package}" do
      command "pip#{node['python']['version']} install #{package}"
      live_stream true
    end
end

node['package']['pip_upgrade'].each do |package|
    log "Upgrading Python Package #{package}"
    execute "pip#{node['python']['version']} install #{package} --upgrade" do
      command "pip#{node['python']['version']} install #{package} --upgrade"
      live_stream true
    end
end