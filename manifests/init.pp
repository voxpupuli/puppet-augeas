class augeas {

  $version = $augeas_version ? {
    ''      => 'present',
    default => $augeas_version
  }

  case $operatingsystem {
    /RedHat|CentOS|Fedora/:   { include augeas::redhat }
    /Debian|Ubuntu|kFreeBSD/: { include augeas::debian }
    default:                  { include augeas::base }
  }
}
