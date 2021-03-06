name             'sprout-postgresql'
maintainer       'Pivotal'
maintainer_email 'sprout-maintainers@googlegroups.com'
license          'MIT'
description      'Recipes to install and configure PostgreSQL on OS X'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports         'mac_os_x'
depends          'homebrew', '>= 1.5.4'
depends          'sprout-base'

issues_url 'https://github.com/pivotal-sprout/sprout-postgresql/issues'
source_url 'https://github.com/pivotal-sprout/sprout-postgresql'
