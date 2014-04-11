destroy_database = node['sprout']['postgresql']['destroy_database_cluster']
homebrew_root = File.join('/', 'usr', 'local')
data_directory = File.join(homebrew_root, 'var', 'postgres')

directory data_directory do
  action :delete
  recursive true
  only_if { destroy_database }
end
