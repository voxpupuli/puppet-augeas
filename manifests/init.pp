# Class: augeas
#
# Install and configure Augeas
#
# Parameters:
#   ['version']      - the desired version of Augeas
#   ['ruby_version'] - the desired version of the Ruby bindings for Augeas
#   ['lens_dir']     - the lens directory to use
class augeas (
  $version = $augeas_version,
  $ruby_version = $augeas_ruby_version,
  $lens_dir = $augeas::params::lens_dir,
) inherits augeas::params {

  class {'::augeas::packages': } ->
  class {'::augeas::files': } ->
  Class['augeas']

  Package['ruby-augeas'] -> Augeas <| |>
}
