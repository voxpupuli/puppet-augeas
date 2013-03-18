# simple_* and wrong_os tests
node default {
  class { '::augeas':
    version      => $::augeas_version,
    ruby_version => $::augeas_ruby_version,
    lens_dir     => $::augeas_lens_dir,
  }
}

node 'with_lens_noaugeas' {
  ::augeas::lens { 'foo':
    lens_source => '/tmp/foo.aug',
  }
}

node 'with_lens' {
  include ::augeas
  ::augeas::lens { 'foo':
    lens_source => $::augeas_lens_source,
    test_source => $::augeas_test_source,
    stock_since => $::augeas_stock_since,
  }
}
