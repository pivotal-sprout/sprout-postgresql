opts = node['sprout']['postgresql']

directory "/usr/local/var/postgres" do
  action :delete
  recursive true
  only_if { opts['destroy_database_cluster']}
end
