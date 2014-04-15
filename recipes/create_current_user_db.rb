db_name = node['current_user']

execute "create the database" do
  command "/usr/local/bin/createdb -U #{db_name}"
  user node['current_user']
  only_if do
    db_exists = system("psql -U #{db_name} -c 'select 1' #{db_name} > /dev/null 2>&1")
    !db_exists && node['sprout']['postgresql']['create_user_db']
  end
end
