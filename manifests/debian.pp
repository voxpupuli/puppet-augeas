class augeas::debian inherits augeas::base {
  $packages = [ 'augeas-lenses', 'libaugeas0', 'augeas-tools' ]

  package { $packages:
    ensure => $augeas::params::version,
    before => File[$augeas::params::contribdir],
  }

  package { 'libaugeas-ruby1.8':
    ensure => present,
  }
}
