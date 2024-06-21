# Managed by modulesync - DO NOT EDIT
# https://voxpupuli.org/docs/updating-files-managed-with-modulesync/

source ENV['GEM_SOURCE'] || 'https://rubygems.org'

group :development do
  gem 'ruby-augeas',  :require => false
end

gem 'rake', :require => false
gem 'facter', ENV['FACTER_GEM_VERSION'], :require => false, :groups => [:test]

puppetversion = ENV['PUPPET_GEM_VERSION'] || '~> 7.24'
gem 'puppet', puppetversion, :require => false, :groups => [:test]

# vim: syntax=ruby
