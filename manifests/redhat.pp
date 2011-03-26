class augeas::redhat inherits augeas::base {
	package { [ "augeas", "augeas-libs" ]:
		ensure => $augeas::params::version,
		before => File[$augeas::params::contribdir]
	}
  
	package { "ruby-augeas":
		ensure => present
	}
}
