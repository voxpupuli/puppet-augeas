## 2017-01-09 - Release 1.6.0

- Deprecate Puppet 2 and 3

## 2016-08-19 - Release 1.5.1

- Fix Travis CI tests

## 2016-08-18 - Release 1.5.0

- Use Augeas PPA for Travis CI tests
- Include augeas 'super' class when not declared (fix #93)

## 2015-09-09 - Release 1.4.2

Fix for puppet AIO packaging

## 2015-08-31 - Release 1.4.1

Fix use of is_pe fact for Puppet open-source

## 2015-08-31 - Release 1.4.0

Add support for Puppet Enterprise paths

## 2015-08-21 - Release 1.3.1

Use docker for acceptance tests

## 2015-08-12 - Release 1.3.0

Add puppet AIO packaging support
Allow setting package name of ruby augeas bindings
Add support for Amazon Linux AMI

## 2015-06-26 - Release 1.2.13

Fix strict_variables activation with rspec-puppet 2.2

## 2015-06-24 - Release 1.2.12

fix the ruby-augeas gem installation on SLES and openSUSE

## 2015-05-28 - Release 1.2.11

Add beaker_spec_helper to Gemfile

## 2015-05-26 - Release 1.2.10

Use random application order in nodeset

## 2015-05-26 - Release 1.2.9

add utopic & vivid nodesets

## 2015-05-25 - Release 1.2.8

Don't allow failure on Puppet 4

## 2015-05-13 - Release 1.2.7

Fix source_without_rights warning

## 2015-05-13 - Release 1.2.6

Add puppet-lint-file_source_rights-check gem

## 2015-05-12 - Release 1.2.5

Don't pin beaker

## 2015-04-27 - Release 1.2.4

Add nodeset ubuntu-12.04-x86_64-openstack

## 2015-04-17 - Release 1.2.3

- Add beaker nodesets

## 2015-04-14 - Release 1.2.2

- Fix lens test with content but no source

## 2015-04-03 - Release 1.2.1

- Confine rspec pinning to ruby 1.8

## 2015-03-24 - Release 1.2.0

- Add lens_content and test_content to augeas::lens
- Fix augeas() function

## 2015-03-24 - Release 1.1.7

- Fix for SUSE

## 2015-01-19 - Release 1.1.6

- Add puppet-ling plugins

##2015-01-12 - Release 1.1.5

- Fix LICENSE file
- Add some puppet-lint plugins to Gemfile

##2015-01-07 - Release 1.1.4

- Manage unit tests with rspec-puppet-facts

##2014-12-09 - Release 1.1.0

- Add future parser tests
- Convert specs to rspec3 syntax
- Fix metadata.json

##2014-11-17 - Release 1.0.3

- Lint metadata.json

##2014-11-04 - Release 1.0.2

- Fix path in unit tests
- Drop Puppet 2.7 support

##2014-10-28 - Release 1.0.1
- Add path to exec in augeas::lens

##2014-10-20 - Release 1.0.0
- Linting
- Setup automatic Forge releases

##2014-10-06 - Release 0.3.2
- Remove symlink in spec/ directory (Fix #40)

##2014-09-23 - Release 0.3.1
- Centralize metadata files

##2014-07-02 - Release 0.3.0
###Summary
- Add purge parameter
- Cleanup unscoped variables
