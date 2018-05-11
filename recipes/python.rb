#
# Cookbook:: kevin-cookbook
# Recipe:: python
#
# Copyright:: 2018, Clivern, All Rights Reserved.

log "recipe::python"
log "Installing Python Version #{node['python']['version']}"

package "python#{node['python']['version']}" do
    action :install
end