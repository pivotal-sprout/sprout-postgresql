node.default['sprout']['postgresql']['plist_filename'] = 'homebrew.mxcl.postgresql.plist'
node.default['sprout']['postgresql']['other_plist_filenames_to_unload'] = %w(org.postgresql.postgres.plist)
node.default['sprout']['postgresql']['create_user_db'] = true
node.default['sprout']['postgresql']['create_superuser'] = true
node.default['sprout']['postgresql']['recreate_database_cluster'] = true
