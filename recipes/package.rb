#
# Cookbook:: kevin-cookbook
# Recipe:: package
#
# Copyright:: 2018, Clivern, All Rights Reserved.


node['package']['required'].each do |package|
    log "Installing Package #{package}"
    package "#{package}" do
      action :install
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