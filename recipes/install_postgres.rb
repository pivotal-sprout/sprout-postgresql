include_recipe 'homebrew'

homebrew_root = File.join('/', 'usr', 'local')
data_directory = File.join(homebrew_root, 'var', 'postgres')
preexisting_databases = File.exist?(data_directory)

package 'postgresql'

directory data_directory do
  action :delete
  recursive true
  not_if { preexisting_databases }
end

execute 'recreate database cluster' do # Mixlib::ShellOut incorrectly sets LC_ALL
                                       # to "c" when installing the postgresql Forumala
  command "initdb #{data_directory}"
  environment 'LC_ALL' => nil
  user node['current_user']
  not_if { preexisting_databases }
end
