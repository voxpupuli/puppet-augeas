require 'spec_helper'

describe 'augeas::lens' do
  let (:title) { 'foo' }
  let (:facts) { {
    :augeas_lens_dir     => :undef,
    :augeas_ruby_version => :undef,
    :augeas_version      => :undef,
    :osfamily            => 'RedHat',
    :path                => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  } }
  context 'when no lens_source is passed' do
    it 'should error' do
      expect {
        is_expected.to contain_file('/usr/share/augeas/lenses/foo.aug')
      }.to raise_error(Puppet::Error, /Must pass lens_source/)
    end
  end

  context 'when lens_source is passed' do
    let (:params) { {
      :lens_source => '/tmp/foo.aug',
    } }

    it { is_expected.to contain_file('/usr/share/augeas/lenses/foo.aug') }
    it { is_expected.to contain_exec('Typecheck lens foo') }
    it { is_expected.not_to contain_file('/usr/share/augeas/lenses/tests/test_foo.aug') }
    it { is_expected.not_to contain_exec('Test lens foo') }
  end

  context 'when lens_source and test_source are passed' do
    let (:params) { {
      :lens_source => '/tmp/foo.aug',
      :test_source => '/tmp/test_foo.aug',
    } }

    it { is_expected.to contain_file('/usr/share/augeas/lenses/foo.aug') }
    it { is_expected.to contain_exec('Typecheck lens foo') }
    it { is_expected.to contain_file('/usr/share/augeas/lenses/tests/test_foo.aug') }
    it { is_expected.to contain_exec('Test lens foo') }
  end

  context 'when stock_since is passed and augeas is older' do
    let (:params) { {
      :lens_source => '/tmp/foo.aug',
      :stock_since => '1.2.3',
    } }

    let (:facts) { {
      :augeas_lens_dir     => :undef,
      :augeas_version      => :undef,
      :augeasversion       => '1.0.0',
      :augeas_ruby_version => :undef,
      :osfamily            => 'RedHat',
      :path                => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    } }

    it { is_expected.to contain_file('/usr/share/augeas/lenses/foo.aug') }
    it { is_expected.to contain_exec('Typecheck lens foo') }
  end

  context 'when stock_since is passed and augeas is newer' do
    let (:params) { {
      :lens_source => '/tmp/foo.aug',
      :stock_since => '1.2.3',
    } }

    let (:facts) { {
      :augeas_lens_dir     => :undef,
      :augeas_version      => :undef,
      :augeasversion       => '1.5.0',
      :augeas_ruby_version => :undef,
      :osfamily            => 'RedHat',
      :path                => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    } }

    it { is_expected.not_to contain_file('/usr/share/augeas/lenses/foo.aug') }
    it { is_expected.not_to contain_exec('Typecheck lens foo') }
  end
end
