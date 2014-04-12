# sprout-postgresql cookbook

Chef Recipes to install and configure PostgreSQL on OS X

# Requirements

* ruby
* bundler

# Usage

```
bundle install
soloist run_recipe sprout-postgresql
```

# Attributes

*NOTE:* All preferences are namespaced under `sprout => postgresql` they include:

* `create_user_db` &mdash; Flag for whether to create a database for the current_user; default is `true`
* `create_postgres_user` &mdash; Flag for whether to create the 'postgres' user; default is `true`
* `destroy_database_cluster` &mdash; Flag for whether to remove any data prior to installation; default is `false`
* `recreate_database_cluster` &mdash; Flag for whether to remove all data and run initdb (useful for correctly encoding the template databases); default is `true`
* `plist_filename` &mdash; The name of the LaunchAgent plist file in the homebrew package to load; default is `'homebrew.mxcl.postgresql.plist'`
* `other_plist_filenames_to_unload` &mdash; List of other potential LaunchAgent plist files that may exist on the system to unload and remove; default is `['org.postgresql.postgres.plist']`

To modify attributes (i.e. to configure your postgresql install), add an entry into your `soloistrc` file and run the recipe via soloist:
```ruby
node_attributes:
  sprout:
    postgresql:
      create_user_db: false
      recreate_database_cluster: false
```

# Recipes

1. `sprout-postgresql`
1. `sprout-postgresql::remove_launch_agent`
1. `sprout-postgresql::destroy_database_cluster`
1. `sprout-postgresql::install_postgres`
1. `sprout-postgresql::recreate_database_cluster`
1. `sprout-postgresql::add_launch_agent`
1. `sprout-postgresql::create_current_user_db`

# Authors

* [Jonathan Barnes](http://github.com/codeword)
* [Can Berk Güder](http://github.com/cbguder)
