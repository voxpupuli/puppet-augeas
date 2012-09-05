class augeas::base {
  $lens_dir = '/usr/share/augeas/lenses/contrib'

  $version = $augeas_version ? {
    ''      => 'present',
    default => $augeas_version
  }

  $rubylib_version = $augeas_ruby_version ? {
    ''      => 'present',
    default => $augeas_ruby_version
  }

  file { '/usr/share/augeas':
    ensure  => directory,
    mode    => '0644',
    owner   => 'root',
    group   => 'root'
  }

  file { '/usr/share/augeas/lenses':
    ensure  => directory,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => File['/usr/share/augeas']
  }

  # ensure no file not managed by puppet ends up in there.
  file { $lens_dir:
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => File['/usr/share/augeas/lenses']
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
