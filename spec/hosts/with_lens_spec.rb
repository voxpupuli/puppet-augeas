require 'spec_helper'

describe 'with_lens' do
  let (:facts) { {
    :osfamily => 'RedHat',
  } }

  context 'when lens_source is passed' do
    let (:facts) { {
      :osfamily           => 'RedHat',
      :augeas_lens_source => '/tmp/foo.aug',
    } }

    it { should contain_file('/usr/share/augeas/lenses/foo.aug') }
    it { should contain_exec('Typecheck lens foo') }
    it { should_not contain_file('/usr/share/augeas/lenses/tests/test_foo.aug') }
    it { should_not contain_exec('Test lens foo') }
  end

  context 'when lens_source and test_source are passed' do
    let (:facts) { {
      :osfamily           => 'RedHat',
      :augeas_lens_source => '/tmp/foo.aug',
      :augeas_test_source => '/tmp/test_foo.aug',
    } }

    it { should contain_file('/usr/share/augeas/lenses/foo.aug') }
    it { should contain_exec('Typecheck lens foo') }
    it { should contain_file('/usr/share/augeas/lenses/tests/test_foo.aug') }
    it { should contain_exec('Test lens foo') }
  end

  context 'when stock_since is passed and augeas is older' do
    let (:facts) { {
      :osfamily           => 'RedHat',
      :augeas_lens_source => '/tmp/foo.aug',
      :augeas_stock_since => '1.2.3',
      :augeasversion      => '1.0.0',
    } }

    it { should contain_file('/usr/share/augeas/lenses/foo.aug') }
    it { should contain_exec('Typecheck lens foo') }
  end

  context 'when stock_since is passed and augeas is newer' do
    let (:facts) { {
      :osfamily           => 'RedHat',
      :augeas_lens_source => '/tmp/foo.aug',
      :augeas_stock_since => '1.2.3',
      :augeasversion      => '1.5.0',
    } }

    it { should_not contain_file('/usr/share/augeas/lenses/foo.aug') }
    it { should_not contain_exec('Typecheck lens foo') }
  end
end
