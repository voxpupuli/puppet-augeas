= Augeas Puppet module =

== Usage ==

  include augeas

== Description ==

This module does 3 things:
 
 o lets you force the augeas version by defining $augeas_version, otherwise puppet will
   only ensure the packages are present.
 o lets you force the ruby library version by defining $augeas_ruby_version, otherwise puppet will
   only ensure the libagueas-ruby version will be installed according to internal critera
 o lets you deploy an augeas lens and any associated test files, running unit tests and not installing if they fail:

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
