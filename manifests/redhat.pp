class augeas::redhat inherits augeas::base {
  $packages = [ 'augeas', 'augeas-libs' ]

  package { $packages:
    ensure => $augeas::params::version,
    before => File[$augeas::params::contribdir],
  }

  package { 'ruby-augeas':
    ensure => present,
  }
}
