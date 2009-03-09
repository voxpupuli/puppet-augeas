class augeas {
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
  }
}

class augeas::redhat inherits augeas::base {
  package {
    ["augeas", "augeas-libs", "ruby-augeas"]:
      ensure => "present";
  }
}

class augeas::debian inherits augeas::base {
  package {
    ["augeas-lenses", "libaugeas0", "augeas-tools", "libaugeas-ruby1.8"]:
       ensure => "present";
  }
}
