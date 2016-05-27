require 'spec_helper'

describe 'augeas' do

  context 'when on an unsupported Operating System' do
    let (:facts) do
      {
        :osfamily => 'MS-DOS',
      }
    end

    it 'should fail' do
      expect { is_expected.to compile }.to raise_error(/Unsupported OS family/)
    end
  end

  lens_dir = Puppet.version < '4.0.0' ? '/usr/share/augeas/lenses' : '/opt/puppetlabs/puppet/share/augeas/lenses'

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without params' do
        if Puppet.version < '4.0.0'
          case facts[:osfamily]
          when 'Debian'
            it { is_expected.to contain_package('libaugeas0').with(
              :ensure => 'present'
            ) }
            it { is_expected.to contain_package('augeas-tools').with(
              :ensure => 'present'
            ) }
            it { is_expected.to contain_package('augeas-lenses').with(
              :ensure => 'present'
            ) }
            case facts[:lsbdistcodename]
            when 'squeeze', 'lucid', 'precise'
              let(:facts) do
                super().merge({
                  :rubyversion => '1.8.7',
                })
              end
              it { is_expected.to contain_package('ruby-augeas').with(
                :ensure => 'present',
                :name   => 'libaugeas-ruby1.8'
              ) }
            else
              let(:facts) do
                super().merge({
                  :rubyversion => '1.9.3',
                })
              end
              it { is_expected.to contain_package('ruby-augeas').with(
                :ensure => 'present',
                :name   => 'libaugeas-ruby1.9.1'
              ) }
            end
          when 'RedHat'
            it { is_expected.to contain_package('augeas').with(
              :ensure => 'present'
            ) }
            it { is_expected.to contain_package('augeas-libs').with(
              :ensure => 'present'
            ) }
            it { is_expected.to contain_package('ruby-augeas').with(
              :ensure => 'present',
              :name   => 'ruby-augeas'
            ) }
          end
        end
        it { is_expected.to contain_file(lens_dir).with(
          :ensure       => 'directory',
          :purge        => 'true',
          :force        => 'true',
          :recurse      => 'true',
          :recurselimit => 1
        ) }
        it { is_expected.to contain_file("#{lens_dir}/dist").with(
          :ensure       => 'directory',
          :purge        => 'false'
        ) }
        it { is_expected.to contain_file("#{lens_dir}/tests").with(
          :ensure       => 'directory',
          :purge        => 'true',
          :force        => 'true'
        ).without(:recurse) }
      end

      context 'when versions are specified' do
        let (:params) do
          {
            :version      => '1.2.3',
            :ruby_version => '3.2.1',
          }
        end

        if Puppet.version < '4.0.0'
          case facts[:osfamily]
          when 'Debian'
            it { is_expected.to contain_package('libaugeas0').with(
              :ensure => '1.2.3'
            ) }
            it { is_expected.to contain_package('augeas-tools').with(
              :ensure => '1.2.3'
            ) }
            it { is_expected.to contain_package('augeas-lenses').with(
              :ensure => '1.2.3'
            ) }
            case facts[:lsbdistcodename]
            when 'squeeze', 'lucid', 'precise'
              let(:facts) do
                super().merge({
                  :rubyversion => '1.8.7',
                })
              end
              it { is_expected.to contain_package('ruby-augeas').with(
                :ensure => '3.2.1',
                :name   => 'libaugeas-ruby1.8'
              ) }
            else
              let(:facts) do
                super().merge({
                  :rubyversion => '1.9.3',
                })
              end
              it { is_expected.to contain_package('ruby-augeas').with(
                :ensure => '3.2.1',
                :name   => 'libaugeas-ruby1.9.1'
              ) }
            end
          when 'RedHat'
            it { is_expected.to contain_package('augeas').with(
              :ensure => '1.2.3'
            ) }
            it { is_expected.to contain_package('augeas-libs').with(
              :ensure => '1.2.3'
            ) }
            it { is_expected.to contain_package('ruby-augeas').with(
              :ensure => '3.2.1',
              :name   => 'ruby-augeas'
            ) }
          end
        end
      end

      context 'with a non standard lens_dir' do
        let (:params) do
          {
            :lens_dir => '/opt/augeas/lenses',
          }
        end

        it { is_expected.to contain_file('/opt/augeas/lenses').with(
          :ensure       => 'directory',
          :purge        => 'true',
          :force        => 'true',
          :recurse      => 'true',
          :recurselimit => 1
        ) }
        it { is_expected.to contain_file('/opt/augeas/lenses/dist').with(
          :ensure       => 'directory',
          :purge        => 'false'
        ) }
        it { is_expected.to contain_file('/opt/augeas/lenses/tests').with(
          :ensure       => 'directory',
          :purge        => 'true',
          :force        => 'true'
        ).without(:recurse) }
      end

      context 'with Puppet Enterprise' do
        let (:facts) do
          facts.merge({
            :is_pe => true,
          })
        end

        if Puppet::Util::Package.versioncmp(Puppet.version, '4.0.0') >= 0
            # the enterprise lens dir is the same in 4
            pe_lens_dir = lens_dir
        else
            pe_lens_dir = '/opt/puppet/share/augeas/lenses'
        end

        it { is_expected.to contain_file(pe_lens_dir).with(
          :ensure       => 'directory',
          :force        => 'true',
          :recurse      => 'true',
          :recurselimit => 1
        ) }
        it { is_expected.to contain_file("#{pe_lens_dir}/dist").with(
          :ensure  => 'directory',
          :purge   => 'false'
        ) }
        it { is_expected.to contain_file("#{pe_lens_dir}/tests").with(
          :ensure => 'directory',
          :force  => 'true',
          :purge  => 'true'
        ).without(:recurse) }
      end

    end
  end
end
