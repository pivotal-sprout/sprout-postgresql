include_recipe 'sprout-postgresql::install_postgres'

execute 'start postgresql' do
  command 'brew services start postgresql'
  user node['sprout']['user']
end

ruby_block 'wait ten seconds for the database to start' do
  block do
    sleep 10
  end
end
