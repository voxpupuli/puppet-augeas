# Class: augeas
#
# Install and configure Augeas
#
# Parameters:
#   ['lens_dir']     - the lens directory to use
#   ['purge']        - whether to purge lens directories
class augeas (
  Stdlib::Absolutepath $aio_lens_dir,
  Stdlib::Absolutepath $pe_lens_dir,
  Stdlib::Absolutepath $system_lens_dir,
  String $files_owner = 'root',
  String $files_group = 'root',
  Optional[Stdlib::Absolutepath] $lens_dir = undef,
  $purge        = true,
) {
  contain 'augeas::files'
}
