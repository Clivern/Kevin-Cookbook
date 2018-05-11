#
# Cookbook:: kevin-cookbook
# Recipe:: app
#
# Copyright:: 2018, Clivern, All Rights Reserved.

log "recipe::app"

directory "#{node['app']['base_dir']}" do
    action :create
end

["#{node['app']['base_dir']}", "#{node['app']['base_dir']}/releases"].each do |dir|
    log "Creating directory #{dir}"
    directory "#{dir}" do
        action :create
    end
end

["#{node['app']['base_dir']}/shared", "#{node['app']['base_dir']}/shared/app", "#{node['app']['base_dir']}/shared/database", "#{node['app']['base_dir']}/shared/logs", "#{node['app']['base_dir']}/shared/mails"].each do |dir|
    log "Creating directory #{dir}"
    directory "#{dir}" do
        owner 'www-data'
        group 'www-data'
        mode '0755'
        action :create
    end
end

bash 'Setup Application' do
  code <<-EOH
    cd #{node['app']['base_dir']}/releases
    rm -rf current
    git clone -b #{node['app']['branch']} #{node['app']['repository']} current
    cd current
    LATEST=$(git rev-parse HEAD)
    if [ ! -d "#{node['app']['base_dir']}/releases/$LATEST/" ]; then
        cd #{node['app']['base_dir']}/releases
        ls -t | tail -n +5 | xargs rm -rf --
        mv current $LATEST
        ln -sf #{node['app']['base_dir']}/releases/$LATEST #{node['app']['base_dir']}/current
        rm -rf #{node['app']['base_dir']}/current/.git
        rm -rf #{node['app']['base_dir']}/current/storage
        ln -sf #{node['app']['base_dir']}/shared #{node['app']['base_dir']}/current/storage
        chmod -R 775 #{node['app']['base_dir']}/current/storage #{node['app']['base_dir']}/shared
        chown -R www-data:www-data #{node['app']['base_dir']}/current/storage #{node['app']['base_dir']}/shared
        echo $(date) > #{node['app']['base_dir']}/latest_deployment.log
    else
        if [ ! -L "#{node['app']['base_dir']}/releases/current" ]; then
            ln -sf #{node['app']['base_dir']}/releases/$LATEST #{node['app']['base_dir']}/current
        fi
        cd #{node['app']['base_dir']}/releases
        rm -rf current
        echo $(date) > #{node['app']['base_dir']}/latest_run.log
    fi
    EOH
end