recreate_database = node['sprout']['postgresql']['recreate_database_cluster']
homebrew_root = File.join('/', 'usr', 'local')
data_directory = File.join(homebrew_root, 'var', 'postgres')
preexisting_databases = File.exists?(data_directory)
env = {'LC_ALL' => nil}

include_recipe "homebrew"
package "postgresql"

directory data_directory do
  action :delete
  recursive true
  only_if { !preexisting_databases && recreate_database }
end

execute 'recreate database cluster' do
  command "initdb #{data_directory}"
  environment env
  user node['current_user']
  only_if { !preexisting_databases && recreate_database }
end
