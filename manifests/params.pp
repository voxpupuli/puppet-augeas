# Class: augeas::params
#
# Default parameters for the Augeas module
#
class augeas::params {
  case $facts['os']['family'] {
    'RedHat': {
      $ruby_pkg = $facts['os']['name'] ? {
        # Amazon Linux AMI (2014.09 and 2015.03) uses ruby 2.0
        'Amazon' => 'ruby20-augeas',
        default => 'ruby-augeas'
      }
      $augeas_pkgs = ['augeas', 'augeas-libs']
    }

    'Suse': {
      # RPM Sources: https://build.opensuse.org/project/show/systemsmanagement:puppet
      if versioncmp($facts['ruby']['version'], '2.1.2') >= 0 {
        # SLES 12 / openSUSE
        $ruby_pkg = 'ruby2.1-rubygem-ruby-augeas'
      } else {
        # SLES 11 SP3
        $ruby_pkg = 'ruby1.8-rubygem-ruby-augeas'
      }
      $augeas_pkgs = ['augeas', 'augeas-lenses', 'libaugeas0']
    }

    'Debian': {
      if versioncmp($facts['ruby']['version'], '2.1.0') >= 0 {
        $ruby_pkg = 'ruby-augeas'
      }
      elsif versioncmp($facts['ruby']['version'], '1.9.1') >= 0 {
        $ruby_pkg = 'libaugeas-ruby1.9.1'
      } else {
        $ruby_pkg = 'libaugeas-ruby1.8'
      }
      $augeas_pkgs = ['augeas-lenses', 'libaugeas0', 'augeas-tools']
    }

    'Archlinux': {
      $ruby_pkg = 'ruby-augeas'
      $augeas_pkgs = ['augeas']
    }

    default:  { fail("Unsupported OS family: ${facts['os']['family']}") }
  }

  if versioncmp($facts['puppetversion'], '4.0.0') >= 0 {
    $lens_dir = '/opt/puppetlabs/puppet/share/augeas/lenses'
  } elsif (defined('$is_pe') and str2bool("${facts['is_pe']}")) { # lint:ignore:only_variable_string
    # puppet enterpise has a different lens location
    $lens_dir = '/opt/puppet/share/augeas/lenses'
  } else {
    $lens_dir = '/usr/share/augeas/lenses'
  }
}
