require 'spec_helper'

describe 'augeas::lens' do
  let (:title) { 'foo' }

  lens_dir = Puppet.version < '4.0.0' ? '/usr/share/augeas/lenses' : '/opt/puppetlabs/puppet/share/augeas/lenses'

  context 'when declaring augeas class first' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context 'With standard augeas version' do

          context 'when no lens_source is passed' do
            it 'should error' do
              expect { is_expected.to compile }.to raise_error(/You must set either \$lens_source or \$lens_content/)
            end
          end

          context 'when lens_source is passed' do
            let (:params) do
              {
                :lens_source => '/tmp/foo.aug',
              }
            end

            it { is_expected.to contain_file("#{lens_dir}/foo.aug") }
            it { is_expected.to contain_exec('Typecheck lens foo') }
            it { is_expected.not_to contain_file("#{lens_dir}/tests/test_foo.aug") }
            it { is_expected.not_to contain_exec('Test lens foo') }
          end

          context 'when lens_source and test_source are passed' do
            let (:params) do
              {
                :lens_source => '/tmp/foo.aug',
                :test_source => '/tmp/test_foo.aug',
              }
            end

            it { is_expected.to contain_file("#{lens_dir}/foo.aug") }
            it { is_expected.to contain_file("#{lens_dir}/tests/test_foo.aug") }
            it { is_expected.to contain_exec('Typecheck lens foo') }
            it { is_expected.to contain_exec('Test lens foo') }
          end
        end

        context 'when stock_since is passed and augeas is older' do
          let (:params) do
            {
              :lens_source => '/tmp/foo.aug',
              :stock_since => '1.2.3',
            }
          end

          let(:facts) do
            super().merge({
              :augeasversion => '1.0.0',
            })
          end

          it { is_expected.to contain_file("#{lens_dir}/foo.aug") }
          it { is_expected.to contain_exec('Typecheck lens foo') }
        end

        context 'when stock_since is passed and augeas is newer' do
          let (:params) do
            {
              :lens_source => '/tmp/foo.aug',
              :stock_since => '1.2.3',
            }
          end

          let(:facts) do
            super().merge({
              :augeasversion => '1.3.0',
            })
          end

          it do
            is_expected.not_to contain_file("#{lens_dir}/foo.aug")
          end
          it do
            is_expected.not_to contain_exec('Typecheck lens foo')
          end
        end
      end
    end
  end
end
