# Class: augeas
#
# Install and configure Augeas
#
# Parameters:
#   ['version']      - the desired version of Augeas
#   ['ruby_version'] - the desired version of the Ruby bindings for Augeas
#   ['lens_dir']     - the lens directory to use
#   ['purge']        - whether to purge lens directories
class augeas (
  $version      = present,
  $ruby_version = present,
  $lens_dir     = $augeas::params::lens_dir,
  $purge        = true,
) inherits augeas::params {

  if versioncmp($::puppetversion, '4.0.0') >= 0 {
    class {'::augeas::files': } ->
    Class['augeas']
  } else {
    class {'::augeas::packages': } ->
    class {'::augeas::files': } ->
    Class['augeas']

    # lint:ignore:spaceship_operator_without_tag
    Package['ruby-augeas', $augeas::params::augeas_pkgs] -> Augeas <| |>
    # lint:endignore
  }

}
