class augeas::base {

  case $operatingsystem {
    RedHat: {
      package {
        ["augeas", "augeas-libs", "ruby-augeas"]:
          ensure => "present";
      }
    }

    Debian, Ubuntu: {
      package {
        ["augeas-lenses", "libaugeas0", "augeas-tools", "libaugeas-ruby1.8"]:
          ensure => "present";
      }
    }
  }

  file {"/usr/share/augeas/lenses/contrib":
    ensure => directory,
  }
}
