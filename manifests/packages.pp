# Class: augeas::packages
#
# Sets up packages for Augeas
#
class augeas::packages {
  # Augeas packages
  $augeas_ensure = $augeas::version ? {
    ''      => 'present',
    default => $augeas::version
  }

  package { $augeas::params::augeas_pkgs:
    ensure => $augeas_ensure,
  }

  # Ruby package
  $ruby_ensure = $augeas::ruby_version ? {
    ''      => 'present',
    default => $augeas::ruby_version
  }

  package { 'ruby-augeas':
    ensure => $ruby_ensure,
    name   => $augeas::params::ruby_pkg,
  }
}
