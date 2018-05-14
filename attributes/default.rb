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
default['app']['env'] = {

    "APP_NAME": "Kevin",
    "APP_KEY": "",
    "APP_DEBUG": "true",
    "APP_URL": "http://localhost",

    "CURRENT_THEME": "default",

    "DB_CONNECTION": "sqlite",
    "DB_HOST": "127.0.0.1",
    "DB_PORT": "3306",
    "DB_DATABASE": "kevin",
    "DB_USERNAME": "root",
    "DB_PASSWORD": "secret",

    "REDIS_HOST": "127.0.0.1",
    "REDIS_PASSWORD": "null",
    "REDIS_PORT": "6379",

    "MAIL_DRIVER": "smtp",
    "MAIL_HOST": "smtp.mailtrap.io",
    "MAIL_PORT": "2525",
    "MAIL_USERNAME": "null",
    "MAIL_PASSWORD": "null",
    "MAIL_ENCRYPTION": "null",

    "ALLOWED_HOSTS": "*",
    "APP_TIMEZONE": "UTC",
    "APP_LANGUAGE": "en-us",

    "DJANGO_LOGGING_HANDLERS": "",
    "DJANGO_LOGGING_LEVEL": "warning",
    "DJANGO_LOGGING_PROPAGATE": "false",

    "APP_LOGGING_HANDLERS": "file",
    "APP_LOGGING_LEVEL": "warning",
    "APP_LOGGING_PROPAGATE": "true"
}

# We Don't recommend to install db with chef
# Do it manually & make it secure
default['mysql']['version'] = "5.7"
default['mysql']['root_password'] = "root"
default['mysql']['install'] = false
default['mysql']['create_db'] = false
default['mysql']['client'] = false
default['mysql']['db_name'] = "kevin"