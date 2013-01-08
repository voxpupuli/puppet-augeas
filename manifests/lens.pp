/*

== Definition: augeas::lens

Deploy an Augeas lens (and its test file).
Check the lens (and run the unit tests) automatically and remove the files if
the checks fail.

Parameters:
- *ensure*: present/absent
- *lens_source*: the source for the lens
- *test_source*: optionally, the source for the test file.
- *stock_since*: optionally, indicate in which version of Augeas
  the lens became stock, so it will not be deployed above that version.

Example usage:

  augeas::lens { 'networkmanager':
    lens_source => 'puppet:///modules/networkmanager/lenses/networkmanager.aug',
    test_source => 'puppet:///modules/networkmanager/lenses/test_networkmanager.aug',
    stock_since => '1.0.0',
  }

*/

define augeas::lens (
  $lens_source,
  $ensure=present,
  $test_source=false,
  $stock_since=false,
) {

  if (!$stock_since or !versioncmp($::augeasversion, $stock_since)) {
    include augeas::base

    $lens_dest = "${augeas::base::lens_dir}/${name}.aug"
    $test_dest = "${augeas::base::lens_dir}/tests/test_${name}.aug"

    file { $lens_dest:
      ensure => $ensure,
      source => $lens_source,
    }

    exec { "Typecheck lens ${name}":
      command     => "augparse -I ${augeas::base::lens_dir} ${lens_dest} || (rm -f ${lens_dest} && exit 1)",
      refreshonly => true,
      subscribe   => File[$lens_dest],
    }

    if $test_source {
      file { $test_dest:
        ensure => $ensure,
        source => $test_source,
        notify => Exec["Test lens ${name}"],
      }

      exec { "Test lens ${name}":
        command     => "augparse -I ${augeas::base::lens_dir} ${test_dest} || (rm -f ${lens_dest} && rm -f ${test_dest} && exit 1)",
        refreshonly => true,
        subscribe   => File[$lens_dest, $test_dest],
      }
    }
  }
}
