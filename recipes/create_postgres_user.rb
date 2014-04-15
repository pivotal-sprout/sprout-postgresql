execute 'create the postgres superuser' do
  command "/usr/local/bin/createuser -U #{node['current_user']} --superuser postgres"
  user node['current_user']
  only_if do
    user_exists = system(%Q|psql -U #{node['current_user']} -c "SELECT 1 FROM pg_roles WHERE rolname='postgres'" postgres > /dev/null 2>&1|)
    !user_exists && node['sprout']['postgresql']['create_postgres_user']
  end
end
