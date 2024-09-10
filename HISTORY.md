## [1.9.0](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.9.0) (2020-01-08)

- Support Archlinux osfamily (GH #74)
- Convert to PDK (GH #76)
- Port augeas() function to Puppet 4.x API (GH #77)

## [1.8.0](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.8.0) (2019-07-23)

- Allow Puppet 6 and remove stdlib dependency (GH #73)

## [1.7.0](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.7.0) (2018-09-03)

- Remove pe requirements
- Use cwd to make commands shorter (GH #63)
- Assert types (GH #64)
- Fix beaker version to 3.13
- Fix stdlib dependency (GH #72)

## [1.6.1](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.6.1) (2017-03-31)

- Update versions in tests
- Linting

## [1.6.0](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.6.0) (2017-01-09)

- Deprecate Puppet 2 and 3

## [1.5.1](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.5.1) (2016-08-19)

- Fix Travis CI tests

## [1.5.0](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.5.0) (2016-08-18)

- Use Augeas PPA for Travis CI tests
- Include augeas 'super' class when not declared (fix #93)

## [1.4.2](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.4.2) (2015-09-09)

Fix for puppet AIO packaging

## [1.4.1](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.4.1) (2015-08-31)

Fix use of is_pe fact for Puppet open-source

## [1.4.0](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.4.0) (2015-08-31)

Add support for Puppet Enterprise paths

## [1.3.1](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.3.1) (2015-08-21)

Use docker for acceptance tests

## [1.3.0](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.3.0) (2015-08-12)

Add puppet AIO packaging support
Allow setting package name of ruby augeas bindings
Add support for Amazon Linux AMI

## [1.2.13](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.13) (2015-06-26)

Fix strict_variables activation with rspec-puppet 2.2

## [1.2.12](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.12) (2015-06-24)

fix the ruby-augeas gem installation on SLES and openSUSE

## [1.2.11](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.11) (2015-05-28)

Add beaker_spec_helper to Gemfile

## [1.2.10](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.10) (2015-05-26)

Use random application order in nodeset

## [1.2.9](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.9) (2015-05-26)

add utopic & vivid nodesets

## [1.2.8](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.8) (2015-05-25)

Don't allow failure on Puppet 4

## [1.2.7](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.7) (2015-05-13)

Fix source_without_rights warning

## [1.2.6](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.6) (2015-05-13)

Add puppet-lint-file_source_rights-check gem

## [1.2.5](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.5) (2015-05-12)

Don't pin beaker

## [1.2.4](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.4) (2015-04-27)

Add nodeset ubuntu-12.04-x86_64-openstack

## [1.2.3](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.3) (2015-04-17)

- Add beaker nodesets

## [1.2.2](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.2) (2015-04-14)

- Fix lens test with content but no source

## [1.2.1](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.1) (2015-04-03)

- Confine rspec pinning to ruby 1.8

## [1.2.0](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.2.0) (2015-03-24)

- Add lens_content and test_content to augeas::lens
- Fix augeas() function

## [1.1.7](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.1.7) (2015-03-24)

- Fix for SUSE

## [1.1.6](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.1.6) (2015-01-19)

- Add puppet-ling plugins

## [1.1.5](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.1.5) (2015-01-12)

- Fix LICENSE file
- Add some puppet-lint plugins to Gemfile

## [1.1.4](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.1.4) (2015-01-07)

- Manage unit tests with rspec-puppet-facts

## [1.1.0](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.1.0) (2014-12-09)

- Add future parser tests
- Convert specs to rspec3 syntax
- Fix metadata.json

## [1.0.3](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.0.3) (2014-11-17)

- Lint metadata.json

## [1.0.2](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.0.2) (2014-11-04)

- Fix path in unit tests
- Drop Puppet 2.7 support

## [1.0.1](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.0.1) (2014-10-28)
- Add path to exec in augeas::lens

## [1.0.0](https://github.com/voxpupuli/puppet-augeas/releases/tag/1.0.0) (2014-10-20)
- Linting
- Setup automatic Forge releases

## [0.3.2](https://github.com/voxpupuli/puppet-augeas/releases/tag/0.3.2) (2014-10-06)
- Remove symlink in spec/ directory (Fix #40)

## [0.3.1](https://github.com/voxpupuli/puppet-augeas/releases/tag/0.3.1) (2014-09-23)
- Centralize metadata files

## [0.3.0](https://github.com/voxpupuli/puppet-augeas/releases/tag/0.3.0) (2014-07-02)
###Summary
- Add purge parameter
- Cleanup unscoped variables
