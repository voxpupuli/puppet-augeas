define augeas::lens (
  $ensure=present,
  $lens_dir,
  $lens_file='',
  $test_file=''
) {

  $lenses_dir = "/usr/share/augeas/lenses"

  file { "${lenses_dir}/tests":
    ensure => directory
  }

#  $lens_file_source = $lens_file ? {
#    '' => $lens_dir ? {
#            '' => fail "Cannot determine lens file for ${name}",
#            default => "${lens_dir}/${name}.aug"
#          },
#    default => $lens_file
#  }


  $lens_file_source = "${lens_dir}/${name}.aug"
  $lens_file_dest = "${lenses_dir}/${name}.aug"

#  $test_file_source = $test_file ? {
#    '' => $lens_dir ? {
#            '' => fail "Cannot determine test file for ${name}",
#            default => "${lens_dir}/tests/test_${name}.aug"
#          },
#    default => $test_file
#  }

  $test_file_source = "${lens_dir}/tests/test_${name}.aug"
  $test_file_dest = "${lenses_dir}/tests/test_${name}.aug"
 
  file { "${lens_file_dest}":
    ensure => $ensure,
    source => $lens_file_source,
  }

  file { "${test_file_dest}":
    ensure => $ensure,
    source => $test_file_source,
  }

  exec { "Typecheck lens":
    command => "augparse -I ${lenses_dir} ${lens_file_dest} || (rm -f ${lens_file_dest} && exit 1)",
    require => File["${lens_file_dest}"]
  }
   
  exec { "Test lens":
    command => "augparse -I ${lenses_dir} ${test_file_dest} || (rm -f ${lens_file_dest} && rm -f ${test_file_dest} && exit 1)",
    require => File["${lens_file_dest}", "${test_file_dest}"]
  }
}
