class augeas::base {
	# ensure no file not managed by puppet ends up in there.
	file { $augeas::params::contribdir:
		ensure  => directory,
		owner   => root,
		group   => root,
		mode    => 0644,
		recurse => true,
		purge   => true,
		force   => true
	}
}
