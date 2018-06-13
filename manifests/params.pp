# Class: augeas::params
#
# Default parameters for the Augeas module
#
class augeas::params {

  if versioncmp($::puppetversion, '4.0.0') >= 0 {
    $lens_prefix = '/opt/puppetlabs/puppet'
  } elsif (defined('$is_pe') and str2bool("${::is_pe}")) { # lint:ignore:only_variable_string
    # puppet enterpise has a different lens location
    $lens_prefix = '/opt/puppet'
  } else {
    $lens_prefix = '/usr'
  }

  case $::osfamily {
    'RedHat': {
      $ruby_pkg = $::operatingsystem ? {
        # Amazon Linux AMI (2014.09 and 2015.03) uses ruby 2.0
        'Amazon' => 'ruby20-augeas',
        default => 'ruby-augeas'
      }
      $augeas_pkgs = ['augeas', 'augeas-libs']
      $lens_dir = "${lens_prefix}/share/augeas/lenses"
    }

    'Suse': {
      # RPM Sources: https://build.opensuse.org/project/show/systemsmanagement:puppet
      if versioncmp($::rubyversion, '2.1.2') >= 0 {
        # SLES 12 / openSUSE
        $ruby_pkg = 'ruby2.1-rubygem-ruby-augeas'
      } else {
        # SLES 11 SP3
        $ruby_pkg = 'ruby1.8-rubygem-ruby-augeas'
      }
      $augeas_pkgs = ['augeas', 'augeas-lenses', 'libaugeas0' ]
      $lens_dir = "${lens_prefix}/share/augeas/lenses"
    }

    'Debian': {
      if versioncmp($::rubyversion, '2.1.0') >= 0 {
        $ruby_pkg = 'ruby-augeas'
      }
      elsif versioncmp($::rubyversion, '1.9.1') >= 0 {
        $ruby_pkg = 'libaugeas-ruby1.9.1'
      } else {
        $ruby_pkg = 'libaugeas-ruby1.8'
      }
      $augeas_pkgs = ['augeas-lenses', 'libaugeas0', 'augeas-tools']
      $lens_dir = "${lens_prefix}/share/augeas/lenses"
    }

    'FreeBSD': {
      $ruby_pkg = 'rubygem-ruby-augeas'
      $augeas_pkgs = ['augeas']
      $lens_dir = '/usr/local/share/augeas/lenses'
    }

    default:  { fail("Unsupported OS family: ${::osfamily}") }
  }



}
