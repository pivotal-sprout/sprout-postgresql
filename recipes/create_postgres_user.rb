include_recipe 'sprout-postgresql::add_launch_agent'

execute 'create the postgres superuser' do
  command "/usr/local/bin/createuser -U #{node['sprout']['user']} --superuser postgres"
  user node['sprout']['user']
  not_if 'psql -U postgres -c "select 1" &> /dev/null'
end
