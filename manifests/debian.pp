class augeas::debian inherits augeas::base {
	package { [ 'augeas-lenses', 'libaugeas0', 'augeas-tools' ]:
		ensure => $augeas::params::version,
		before => File[$augeas::params::contribdir],
	}

	package { 'libaugeas-ruby1.8':
		ensure => present,
	}
}
