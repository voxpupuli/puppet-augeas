# @summary function to return augeas lens directory
#
# @return [String]
function augeas::lens_dir() >> String {
  if $augeas::lens_dir {
    $augeas::lens_dir
  } elsif versioncmp($facts['puppetversion'], '4.0.0') >= 0 and 'aio_agent_version' in $facts {
    $augeas::aio_lens_dir
  } elsif 'is_pe' in $facts and $facts['is_pe'] {
    $augeas::pe_lens_dir
  } else {
    $augeas::system_lens_dir
  }
}
