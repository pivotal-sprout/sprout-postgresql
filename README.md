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

* `plist_filename` &mdash; The name of the LaunchAgent plist file in the homebrew package to load; default is `'homebrew.mxcl.postgresql.plist'`

# Recipes

1. `sprout-postgresql`
1. `sprout-postgresql::remove_launch_agent`
1. `sprout-postgresql::destroy_database_cluster`
1. `sprout-postgresql::install_postgres`
1. `sprout-postgresql::add_launch_agent`
1. `sprout-postgresql::create_current_user_db`

# Authors

* [Jonathan Barnes](http://github.com/codeword)
* [Can Berk Güder](http://github.com/cbguder)
