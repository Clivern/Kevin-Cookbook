#
# Cookbook:: kevin-cookbook
# Recipe:: pip
#
# Copyright:: 2018, Clivern, All Rights Reserved.

log "recipe::pip"
log "Installing Pip for Python Version #{node['python']['version']}"

package "python#{node['python']['version']}-pip" do
    action :install
end