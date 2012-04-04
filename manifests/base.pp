class augeas::base {
  $lens_dir = '/usr/share/augeas/lenses/contrib'

  # ensure no file not managed by puppet ends up in there.
  file { $lens_dir:
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  file { "${lens_dir}/tests":
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }
}
