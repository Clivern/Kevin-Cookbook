#
# Cookbook:: kevin-cookbook
# Attributes:: default
#
# Copyright:: 2018, Clivern, All Rights Reserved.

default['basic']['update'] = true
default['basic']['upgrade'] = false
default['basic']['autoremove'] = false

default['package']['install_required'] = true
default['package']['required'] = ['git', 'zip', 'unzip']
default['package']['install'] = []
default['package']['upgrade'] = []
default['package']['remove'] = []
default['package']['purge'] = []
default['package']['pip_install'] = ['gunicorn']
default['package']['pip_upgrade'] = ['gunicorn']

default['python']['version'] = "3"

default['pip']['upgrade'] = true