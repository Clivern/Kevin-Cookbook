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

default['app']['base_dir'] = "/var/www/kevin"
default['app']['branch'] = "master"
default['app']['repository'] = "https://github.com/Clivern/Kevin.git"
default['app']['port'] = 80
default['app']['fqdn'] = "127.0.0.1"
default['app']['releases_count'] = 5
default['app']['force_deploy'] = "false"

# We Don't recommend to install db with chef
# Do it manually & make it secure
default['mysql']['version'] = "5.7"
default['mysql']['root_password'] = "root"
default['mysql']['install'] = false
default['mysql']['create_db'] = false
default['mysql']['db_name'] = "kevin"