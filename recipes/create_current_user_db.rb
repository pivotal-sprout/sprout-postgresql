include_recipe 'sprout-postgresql::add_launch_agent'

db_name = node['current_user']

execute 'create a database for the current user' do
  command "/usr/local/bin/createdb -U #{db_name}"
  user node['current_user']
  not_if "psql -U #{db_name} -c 'select 1' #{db_name} &> /dev/null"
end
