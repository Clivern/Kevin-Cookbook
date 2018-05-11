#
# Cookbook:: kevin-cookbook
# Recipe:: nginx
#
# Copyright:: 2018, Clivern, All Rights Reserved.

package "nginx" do
  action :install
end

service "nginx" do
  action [:enable, :start]
end