require 'spec_helper'

describe 'wrong_os' do
  let (:facts) { {
    :augeas_lens_dir     => :undef,
    :augeas_ruby_version => :undef,
    :augeas_test_source  => :undef,
    :augeas_version      => :undef,
    :osfamily            => 'MS-DOS',
  } }

  it 'should fail' do
    expect { should contain_package('ruby-augeas') }.to raise_error(Puppet::Error, /Unsupported OS family/)
  end
end
