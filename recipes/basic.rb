#
# Cookbook:: kevin-cookbook
# Recipe:: basic
#
# Copyright:: 2018, Clivern, All Rights Reserved.

log "recipe::basic"

execute "apt-get update" do
    command "apt-get update"
    live_stream true
    only_if { node['basic']['update'] }
end

execute "apt autoremove" do
    command "apt -y autoremove"
    live_stream true
    only_if { node['basic']['autoremove'] }
end

execute "apt-get upgrade" do
    command "apt-get -y upgrade"
    live_stream true
    only_if { node['basic']['upgrade'] }
end