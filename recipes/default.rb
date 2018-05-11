#
# Cookbook:: kevin-cookbook
# Recipe:: default
#
# Copyright:: 2018, Clivern, All Rights Reserved.

include_recipe 'kevin-cookbook::basic'
include_recipe 'kevin-cookbook::nginx'
include_recipe 'kevin-cookbook::python'
include_recipe 'kevin-cookbook::mysql'
include_recipe 'kevin-cookbook::pip'
include_recipe 'kevin-cookbook::package'
include_recipe 'kevin-cookbook::backup'
include_recipe 'kevin-cookbook::app'