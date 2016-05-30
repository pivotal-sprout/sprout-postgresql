include_recipe 'sprout-postgresql::install_postgres'

execute 'start postgresql' do
  command 'brew services start postgresql'
  user node['sprout']['user']
end

ruby_block 'wait four seconds for the database to start' do
  block do
    sleep 4
  end
end
