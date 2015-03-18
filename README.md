# sprout-postgresql cookbook

[![Build Status](https://travis-ci.org/pivotal-sprout/sprout-postgresql.png?branch=master)](https://travis-ci.org/pivotal-sprout/sprout-postgresql)

Chef Recipes to install and configure PostgreSQL on OS X

## Usage

### Prerequisites

- [system ruby](.ruby-version)
- [bundler](http://bundler.io/)

### Quickstart

```
bundle
bundle exec soloist
```

## Cookbook Usage

### Attributes

*NOTE:* All preferences are namespaced under `sprout => postgresql` they include:

* `plist_filename` &mdash; The name of the LaunchAgent plist file in the homebrew package to load; default is `'homebrew.mxcl.postgresql.plist'`

### Recipes

1. `sprout-postgresql`
1. `sprout-postgresql::install_postgres`
1. `sprout-postgresql::add_launch_agent`
1. `sprout-postgresql::create_current_user_db`

## Contributing

### Before committing

```
bundle
bundle exec rake
```

The default rake task includes rubocop, foodcritic, unit specs

### [Rubocop](https://github.com/bbatsov/rubocop)

```
bundle
bundle exec rake rubocop
```

### [FoodCritic](http://acrmp.github.io/foodcritic/)

```
bundle
bundle exec rake foodcritic
```

### Unit specs

unit testing is done with [ServerSpec](http://serverspec.org/)

```
bundle
bundle exec rake spec:unit
```

### Integration specs

Integrations specs will run the default recipe on the host system (destructive) and make assertions on the system after 
install.  It has a precondition that postgresql is *not* installed on the system.

```
bundle
bundle exec rake spec:integration
```

Before or after running the integration specs, you can clean up the side effects by running the following. These commands will wipe out any postgres database(s) you may have running.

```bash
killall postgres
brew remove --force postgresql
rm -rf /usr/local/var/postgres/
rm ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```
