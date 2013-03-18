class augeas::params {
  $lens_dir = '/usr/share/augeas/lenses'

  case $::osfamily {
    'RedHat': {
      $ruby_pkg = 'ruby-augeas'
      $augeas_pkgs = ['augeas', 'augeas-libs']
    }

    'Debian': {
      $ruby_pkg = $::lsbdistcodename ? {
        'wheezy' => 'libaugeas-ruby1.9.1',
        default  => 'libaugeas-ruby1.8',
      }
      $augeas_pkgs = ['augeas-lenses', 'libaugeas0', 'augeas-tools']
    }

    default:  { fail("Unsupported OS family: ${::osfamily}") }
  }
}
