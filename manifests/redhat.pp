class augeas::redhat inherits augeas::base {

  package {
    ['augeas', 'augeas-libs']:
      ensure => $augeas::base::version,
      before => File['/usr/share/augeas/lenses'],
  }

  package { 'ruby-augeas':
    ensure => $augeas::base::rubylib_version,
  }

}
