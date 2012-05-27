# Class: augeas::params
#
#
class augeas::params {
  $version = $augeas_version ? {
    ''      => present,
    default => $augeas_version,
  }

  $contribdir = $augeas_contribdir ? {
    ''      => '/usr/share/augeas/lenses/contrib',
    default => $augeas_contribdir,
  }
}
