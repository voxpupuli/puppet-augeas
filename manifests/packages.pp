class augeas::packages {
  # Augeas packages
  $augeas_ensure = $augeas::version ? {
    ''      => 'present',
    default => $augeas::version
  }

  package { $augeas::params::pkgs:
    ensure => $augeas_ensure,
  }

  # Ruby package
  $ruby_ensure = $augeas::ruby_version ? {
    ''      => 'present',
    default => $augeas::ruby_version
  }

  package { $augeas::params::ruby_pkg:
    ensure => $ruby_ensure,
  }
}
