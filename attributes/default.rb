#
# Cookbook:: kevin-cookbook
# Attributes:: default
#
# Copyright:: 2018, Clivern, All Rights Reserved.

default['basic']['update'] = true
default['basic']['upgrade'] = false
default['basic']['autoremove'] = false


default['package']['required'] = ['git', 'zip', 'unzip']
default['package']['install'] = []
default['package']['upgrade'] = []
default['package']['remove'] = []
default['package']['purge'] = []