class augeas {
	require augeas::params
	
	case $operatingsystem {
		/(?i)(RedHat|CentOS|Fedora)/:   { include augeas::redhat }
		/(?i)(Debian|Ubuntu|kFreeBSD)/: { include augeas::debian }
		default:                        { include augeas::base }
	}
}
