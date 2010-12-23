import "classes/*.pp"

class augeas {
	if ( ! $augeas_version ) {
		$augeas_version = "present"
	}

	case $operatingsystem {
		/RedHat|CentOS|Fedora/:   { include augeas::redhat }
		/Debian|Ubuntu|kFreeBSD/: { include augeas::debian }
		default:                  { include augeas::base }
	}
}