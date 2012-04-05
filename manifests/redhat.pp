class augeas::redhat inherits augeas::base {

  package {
    ['augeas', 'augeas-libs']:
      ensure => "${augeas::version}",
      before => File['/usr/share/augeas/lenses/contrib'],
  }
  package { 'ruby-augeas': ensure => "${augeas::rubylib_version}" }

}
