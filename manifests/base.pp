class augeas::base {

  # ensure no file not managed by puppet ends up in there.
  file { "/usr/share/augeas/lenses/contrib":
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
    mode    => 0644,
    owner   => "root",
    group   => "root",
  }
}
