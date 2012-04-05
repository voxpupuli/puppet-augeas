class augeas {

  $version = $::augeasversion ? {
    ''      => 'present',
    default => $::augeasversion
  }

  case $operatingsystem {
    /RedHat|CentOS|Fedora/:   { include augeas::redhat }
    /Debian|Ubuntu|kFreeBSD/: { include augeas::debian }
    default:                  { include augeas::base }
  }
}
