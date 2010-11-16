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

class augeas::base {

  # ensure no file not managed by puppet ends up in there.
  file { "/usr/share/augeas/lenses/contrib":
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
    mode    => 0644,
    owner   => "root",
    group   => "root",
  }
}

class augeas::redhat inherits augeas::base {

  package {
    ["augeas", "augeas-libs"]:
      ensure => $augeas_version,
      before => File["/usr/share/augeas/lenses/contrib"],
  }
  package { "ruby-augeas": ensure => present }

}

class augeas::debian inherits augeas::base {

  package {
    ["augeas-lenses", "libaugeas0", "augeas-tools"]:
       ensure => $augeas_version,
       before => File["/usr/share/augeas/lenses/contrib"],
  }
  package { "libaugeas-ruby1.8": ensure => present }

}
