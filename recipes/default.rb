include_recipe 'sprout-postgresql::install_postgres'
include_recipe 'sprout-postgresql::add_launch_agent'
include_recipe 'sprout-postgresql::create_current_user_db'
include_recipe 'sprout-postgresql::create_postgres_user'
