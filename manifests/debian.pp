class augeas::debian inherits augeas::base {

  package {
    ['augeas-lenses', 'libaugeas0', 'augeas-tools']:
      ensure => "${augeas::version}",
      before => File['/usr/share/augeas/lenses/contrib'],
  }
  package {'libaugeas-ruby1.8': ensure => present }

}
