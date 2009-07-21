class augeas {

  if ( ! $augeas_version ) {
    $augeas_version = "present",
  }

  case $operatingsystem {
    redhat: { include augeas::redhat }
    debian: { include augeas::debian }
    ubuntu: { include augeas::debian }
    default: { include augeas::base }
  }
}

class augeas::base {
  file {"/usr/share/augeas/lenses/contrib":
    ensure => directory,
    require => $operatingsystem ? {
      debian => Package["augeas-lenses"],
      redhat => Package["augeas"],
    },
  }
}

class augeas::redhat inherits augeas::base {

  package {
    ["augeas", "augeas-libs"]:
      ensure => $augeas_version,
  }
  package { "ruby-augeas": ensure => present }

}

class augeas::debian inherits augeas::base {

  package {
    ["augeas-lenses", "libaugeas0", "augeas-tools"]:
       ensure => $augeas_version,
  }
  package { "libaugeas-ruby1.8": ensure => present }

}
