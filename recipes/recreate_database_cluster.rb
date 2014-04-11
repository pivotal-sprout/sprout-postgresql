recreate_database = node['sprout']['postgresql']['recreate_database_cluster']
homebrew_root = File.join('/', 'usr', 'local')
data_directory = File.join(homebrew_root, 'var', 'postgres')

directory data_directory do
  action :delete
  recursive true
  only_if { recreate_database }
end

execute 'recreate database cluster' do
  command "initdb #{data_directory}"
  user node['current_user']
  only_if { recreate_database }
end
