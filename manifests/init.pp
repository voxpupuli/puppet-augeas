# Class: augeas
#
# Install and configure Augeas
#
# Parameters:
#
# @param version
# @param ruby_package
# @param ruby_version
# @param lens_dir
# @param purge
#
class augeas (
  String $version      = present,
  String $ruby_package = $augeas::params::ruby_pkg,
  String $ruby_version = present,
  String $lens_dir     = $augeas::params::lens_dir,
  Boolean $purge       = true,
) inherits augeas::params {
  if versioncmp($facts['puppetversion'], '4.0.0') >= 0 {
    contain 'augeas::files'
  } else {
    contain 'augeas::packages'
    contain 'augeas::files'
    Class['augeas::packages'] -> Class['augeas::files']

    Package['ruby-augeas', $augeas::params::augeas_pkgs] -> Augeas <| |> # lint:ignore:spaceship_operator_without_tag
  }
}
