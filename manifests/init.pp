class augeas {

  $rubylib_version = $augeas_ruby_version ? {
    ''      => 'present',
    default => $augeas_ruby_version
  }

  case $operatingsystem {
    /RedHat|CentOS|Fedora/:   { include augeas::redhat }
    /Debian|Ubuntu|kFreeBSD/: { include augeas::debian }
    default:                  { include augeas::base }
  }
}
