# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v2.0.0](https://github.com/voxpupuli/puppet-augeas/tree/v2.0.0) (2024-09-10)

[Full Changelog](https://github.com/voxpupuli/puppet-augeas/compare/1.9.0...v2.0.0)

**Breaking changes:**

- drop support for EoL Amazon 2014.09 & 2015.03 [\#108](https://github.com/voxpupuli/puppet-augeas/pull/108) ([jhoblitt](https://github.com/jhoblitt))
- Drop support for EOL operating systems [\#104](https://github.com/voxpupuli/puppet-augeas/pull/104) ([smortex](https://github.com/smortex))
- Drop support for Puppet 4, 5, 6 \(EOL\) [\#101](https://github.com/voxpupuli/puppet-augeas/pull/101) ([smortex](https://github.com/smortex))

**Implemented enhancements:**

- Add support for Debian 12, Ubuntu 24.04 [\#105](https://github.com/voxpupuli/puppet-augeas/pull/105) ([smortex](https://github.com/smortex))
- Add support for current Operating Systems [\#100](https://github.com/voxpupuli/puppet-augeas/pull/100) ([smortex](https://github.com/smortex))
- Add support for Puppet 7 & 8 [\#99](https://github.com/voxpupuli/puppet-augeas/pull/99) ([smortex](https://github.com/smortex))
- Improve facts management [\#92](https://github.com/voxpupuli/puppet-augeas/pull/92) ([smortex](https://github.com/smortex))

**Closed issues:**

- Migrating this Repository to Vox Pupuli [\#96](https://github.com/voxpupuli/puppet-augeas/issues/96)
- Debian 12 support [\#95](https://github.com/voxpupuli/puppet-augeas/issues/95)
- Puppet 8x support [\#94](https://github.com/voxpupuli/puppet-augeas/issues/94)
- puppetserver 7 warning: file does not contain a valid yaml hash [\#91](https://github.com/voxpupuli/puppet-augeas/issues/91)
- Avoid "file does not contain a valid yaml hash" warning for puppetserver [\#86](https://github.com/voxpupuli/puppet-augeas/issues/86)
- $lens\_dir is not set correctly for systems using the official Debian puppet packages [\#65](https://github.com/voxpupuli/puppet-augeas/issues/65)

**Merged pull requests:**

- drop support for EoL Puppet Enterprise \(pe\) [\#107](https://github.com/voxpupuli/puppet-augeas/pull/107) ([jhoblitt](https://github.com/jhoblitt))
- .fixtures.yml: pull dependencies from GitHub [\#102](https://github.com/voxpupuli/puppet-augeas/pull/102) ([bastelfreak](https://github.com/bastelfreak))
- Handle lense\_dir based on $::rubysitedir. [\#87](https://github.com/voxpupuli/puppet-augeas/pull/87) ([bzed](https://github.com/bzed))
- Fix PuppetServer warning [\#85](https://github.com/voxpupuli/puppet-augeas/pull/85) ([smortex](https://github.com/smortex))
- Allow customizing files owner and group [\#84](https://github.com/voxpupuli/puppet-augeas/pull/84) ([smortex](https://github.com/smortex))
- Add FreeBSD support [\#82](https://github.com/voxpupuli/puppet-augeas/pull/82) ([smortex](https://github.com/smortex))
- Resolve puppet-lint [\#81](https://github.com/voxpupuli/puppet-augeas/pull/81) ([jcpunk](https://github.com/jcpunk))
- Now passes yamllint [\#80](https://github.com/voxpupuli/puppet-augeas/pull/80) ([jcpunk](https://github.com/jcpunk))
- Ensure versioncmp 'a' parameter is a string [\#70](https://github.com/voxpupuli/puppet-augeas/pull/70) ([raoulbhatia](https://github.com/raoulbhatia))

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


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
