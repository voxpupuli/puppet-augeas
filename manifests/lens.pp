define augeas::lens (
  $ensure=present,
  $lens_source,
  $test_source=false
) {

  include augeas::base

  $lens_dest = "${augeas::base::lens_dir}/${name}.aug"
  $test_dest = "${augeas::base::lens_dir}/tests/test_${name}.aug"
 
  file { "${lens_dest}":
    ensure => $ensure,
    source => $lens_source,
# We should actually run the test when the lens is changed
# but we need to know if the test exists...
#    notify => Exec["Typecheck lens ${name}", "Test lens ${name}"]
    notify => Exec["Typecheck lens ${name}"]
  }

  exec { "Typecheck lens ${name}":
    command => "augparse -I ${augeas::base::lens_dir} ${lens_dest} || (rm -f ${lens_dest} && exit 1)",
    require => File["${lens_dest}"],
    refreshonly => true,
  }

  if $test_source {
    file { "${test_dest}":
      ensure => $ensure,
      source => $test_source,
      notify => Exec["Test lens ${name}"]
    }
  
    exec { "Test lens ${name}":
      command => "augparse -I ${augeas::base::lens_dir} ${test_dest} || (rm -f ${lens_dest} && rm -f ${test_dest} && exit 1)",
      require => File["${lens_dest}", "${test_dest}"],
      refreshonly => true,
    }
  }
}
