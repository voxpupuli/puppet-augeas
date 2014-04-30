# Class: augeas::packages
#
# Sets up packages for Augeas
#
class augeas::packages {
  package { $::augeas::params::augeas_pkgs:
    ensure => $::augeas::version,
  }

  package { 'ruby-augeas':
    ensure => present,
    name   => $::augeas::params::ruby_pkg,
  }
}
