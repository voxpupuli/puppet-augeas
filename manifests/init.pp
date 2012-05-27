class augeas inherits augeas::params {

  case $operatingsystem {
    /(?i-mx:centos|fedora|redhat|scientific)/: {
      include augeas::redhat
    }
    /(?i-mx:debian|ubuntu|kfreebsd)/: {
      include augeas::debian
    }
    /(?i-mx:gentoo)/: {
      include augeas::gentoo
    }
    default:                        {
      include augeas::base
    }
  }
}
