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

bash 'setup-application' do
  code <<-EOH
    cd #{node['app']['base_dir']}/releases
    rm -rf current
    git clone -b #{node['app']['branch']} #{node['app']['repository']} current
    cd current
    pip#{node['python']['version']} install -r requirements.txt
    LATEST=$(git rev-parse HEAD)
    cd #{node['app']['base_dir']}
    if [ ! -d "#{node['app']['base_dir']}/releases/$LATEST/" ] || [ #{node['app']['force_deploy']} == "true" ]; then
        cd #{node['app']['base_dir']}/releases
        rm -rf $LATEST
        ls -t | tail -n +#{node['app']['releases_count']} | xargs rm -rf --
        mv current $LATEST
        ln -sfn #{node['app']['base_dir']}/releases/$LATEST #{node['app']['base_dir']}/current
        rm -rf #{node['app']['base_dir']}/current/.git
        rm -rf #{node['app']['base_dir']}/current/storage
        ln -sfn #{node['app']['base_dir']}/shared #{node['app']['base_dir']}/current/storage
        chmod -R 775 #{node['app']['base_dir']}/current/storage #{node['app']['base_dir']}/shared
        chown -R www-data:www-data #{node['app']['base_dir']}/current/storage #{node['app']['base_dir']}/shared
        echo $(date) > #{node['app']['base_dir']}/latest_deployment.log
        echo $(date) > #{node['app']['base_dir']}/now.log
    else
        if [ ! -L "#{node['app']['base_dir']}/current" ]; then
            ln -sfn #{node['app']['base_dir']}/releases/$LATEST #{node['app']['base_dir']}/current
            echo $(date) > #{node['app']['base_dir']}/now.log
        fi
        rm -rf #{node['app']['base_dir']}/releases/current
    fi
    echo $(date) > #{node['app']['base_dir']}/latest_run.log
    EOH
end


app_now_file = "#{node['app']['base_dir']}/now.log"

template "#{node['app']['base_dir']}/current/.env" do
    source 'app/env.erb'
    owner "root"
    group "root"
    mode "0644"
    action :create
end

execute "run-application-migrations" do
    command "python#{node['python']['version']} #{node['app']['base_dir']}/current/manage.py migrate"
    live_stream true
end

template '/etc/nginx/sites-available/kevin.com' do
    source 'nginx/kevin.conf.erb'
    owner "root"
    group "root"
    mode "0644"
    action :create
end

link '/etc/nginx/sites-enabled/kevin.com' do
    to '/etc/nginx/sites-available/kevin.com'
    action :create
end

template '/etc/systemd/system/kevin.service' do
    source 'systemctl/kevin.service.erb'
    owner "root"
    group "root"
    mode "0644"
    action :create
end

bash 'restart-kevin-service' do
    code <<-EOF
        systemctl stop kevin.service
        systemctl daemon-reload
        systemctl start kevin.service
    EOF
    only_if { ::File.exist?(app_now_file) }
end

service "nginx" do
    action :restart
    only_if { ::File.exist?(app_now_file) }
end

# Delete The now.log file as it is used as internal notifier for app updates
bash 'delete-deploy-now-file' do
    cwd node['app']['base_dir']
    code <<-EOF
        rm -f now.log
    EOF
    only_if { ::File.exist?(app_now_file) }
end