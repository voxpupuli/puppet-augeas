class augeas (
  $version = $augeas_version,
  $ruby_version = $augeas_ruby_version,
  $lens_dir = $augeas::params::lens_dir,
) inherits augeas::params {

  class {'::augeas::packages': } ->
  class {'::augeas::files': } ->
  Class['augeas']
}
