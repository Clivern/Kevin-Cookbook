#
# Cookbook:: kevin-cookbook
# Recipe:: pip
#
# Copyright:: 2018, Clivern, All Rights Reserved.

log "recipe::pip"
log "Installing pip for Python Version #{node['python']['version']}"

package "python#{node['python']['version']}-pip" do
    action :install
end

execute "pip#{node['python']['version']} upgrade" do
    command "pip#{node['python']['version']} install --upgrade pip"
    live_stream true
    only_if { node['pip']['upgrade'] }
end