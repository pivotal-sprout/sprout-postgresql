
recreate_database = node['sprout']['postgresql']['recreate_database_cluster']
homebrew_root = File.join('/', 'usr', 'local')
data_directory = File.join(homebrew_root, 'var', 'postgres')
preexisting_databases = File.exists?(data_directory)

include_recipe "homebrew"
package "postgresql"

directory data_directory do
  action :delete
  recursive true
  only_if { !preexisting_databases && recreate_database }
end

execute 'recreate database cluster' do # Mixlib::ShellOut incorrectly sets LC_ALL
                                       # to "c" when installing the postgresql Forumala
  command "initdb #{data_directory}"
  environment 'LC_ALL' => nil
  user node['current_user']
  only_if { !preexisting_databases && recreate_database }
end
