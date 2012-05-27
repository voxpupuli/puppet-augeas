class augeas::gentoo inherits augeas::base {
  package { 'augeas':
    ensure => $augeas_version,
    before => File['/usr/share/augeas/lenses/contrib'],
  }

  package { 'ruby-augeas':
    ensure => present,
  }
}
