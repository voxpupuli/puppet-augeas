# @summary function to return augeas lens directory
#
# @return [String]
function augeas::lens_dir() >> String {
  if $augeas::lens_dir {
    $augeas::lens_dir
  } elsif 'aio_agent_version' in $facts {
    $augeas::aio_lens_dir
  } else {
    $augeas::system_lens_dir
  }
}
