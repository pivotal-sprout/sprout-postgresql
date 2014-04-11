execute "create the database" do
  command "/usr/local/bin/createdb -U #{node['current_user']}"
  user node['current_user']
  only_if { node['sprout']['postgres']['create_user_db']}
end
