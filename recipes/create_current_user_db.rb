db_name = node['current_user']

execute 'create the database' do
  command "/usr/local/bin/createdb -U #{db_name}"
  user node['current_user']
  not_if "psql -U #{db_name} -c 'select 1' #{db_name} > /dev/null 2>&1"
end
