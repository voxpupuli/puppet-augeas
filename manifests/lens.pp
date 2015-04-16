# Definition: augeas::lens
#
# Deploy an Augeas lens (and its test file).
# Check the lens (and run the unit tests) automatically and remove the files if
# the checks fail.
#
# Parameters:
#   ['ensure']       - present/absent
#   ['lens_content'] - the content of the lens
#   ['lens_source']  - the source for the lens
#   ['test_content'] - optionally, the content of the test
#   ['test_source']  - optionally, the source for the test file.
#   ['stock_since']  - optionally, indicate in which version of Augeas
#                      the lens became stock, so it will not be deployed
#                      above that version.
#
# Example usage:
#
#   augeas::lens { 'networkmanager':
#     lens_content => file('networkmanager/lenses/networkmanager.aug'),
#     test_content => file('networkmanager/lenses/test_networkmanager.aug'),
#     stock_since  => '1.0.0',
#   }
#
define augeas::lens (
  $ensure       = present,
  $lens_content = undef,
  $lens_source  = undef,
  $test_content = undef,
  $test_source  = undef,
  $stock_since  = false,
) {
  include ::augeas

  if $lens_source != undef {
    if $lens_content != undef {
      fail "You can't set both \$lens_source and \$lens_content"
    } else {
      warning 'Passing "lens_source" is deprecated; please use "lens_content"'
    }
  } else {
    if $lens_content == undef {
      fail "You must set either \$lens_source or \$lens_content"
    }
  }

  if $test_source != undef {
    if $test_content != undef {
      fail "You can't set both \$test_source and \$test_content"
    } else {
      warning 'Passing "test_source" is deprecated; please use "test_content"'
    }
  }

  File {
    owner => 'root',
    group => 'root',
    mode => '0644',
  }

  if (!$stock_since or versioncmp($::augeasversion, $stock_since) < 0) {

    validate_re(
      $augeas::lens_dir,
      '/.*',
      "'${augeas::lens_dir}' is not a valid path for lens ${name}"
    )

    $lens_dest = "${augeas::lens_dir}/${name}.aug"
    $test_dest = "${augeas::lens_dir}/tests/test_${name}.aug"

    # lint:ignore:source_without_rights
    file { $lens_dest:
      ensure  => $ensure,
      source  => $lens_source,
      content => $lens_content,
    }
    # lint:endignore

    exec { "Typecheck lens ${name}":
      command     => "augparse -I ${augeas::lens_dir} ${lens_dest} || (rm -f ${lens_dest} && exit 1)",
      path        => "/opt/puppetlabs/puppet/bin:${::path}",
      refreshonly => true,
      subscribe   => File[$lens_dest],
    }

    if $test_source or $test_content {
      # lint:ignore:source_without_rights
      file { $test_dest:
        ensure  => $ensure,
        source  => $test_source,
        content => $test_content,
        notify  => Exec["Test lens ${name}"],
      }
      # lint:endignore

      exec { "Test lens ${name}":
        command     => "augparse -I ${augeas::lens_dir} ${test_dest} || (rm -f ${lens_dest} && rm -f ${test_dest} && exit 1)",
        path        => "/opt/puppetlabs/puppet/bin:${::path}",
        refreshonly => true,
        subscribe   => File[$lens_dest, $test_dest],
      }
    }
  }
}
