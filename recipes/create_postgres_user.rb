execute 'create the postgres superuser' do
  command "/usr/local/bin/createuser -U #{node['current_user']} --superuser postgres"
  user node['current_user']
  only_if { node['sprout']['postgresql']['create_postgres_user'] }
end