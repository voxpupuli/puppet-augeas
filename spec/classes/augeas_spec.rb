# frozen_string_literal: true

require 'spec_helper'

describe 'augeas' do
  let(:lens_dir) do
    case facts[:os]['family']
    when 'FreeBSD'
      '/usr/local/share/augeas/lenses'
    when 'Archlinux'
      '/usr/share/augeas/lenses'
    else
      if facts[:ruby]['sitedir'] =~ %r{/opt/puppetlabs/puppet}
        '/opt/puppetlabs/puppet/share/augeas/lenses'
      else
        '/usr/share/augeas/lenses'
      end
    end
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without params' do
        it {
          is_expected.to contain_file(lens_dir).with(
            ensure: 'directory',
            purge: 'true',
            force: 'true',
            recurse: 'true',
            recurselimit: 1
          )
        }

        it {
          is_expected.to contain_file("#{lens_dir}/dist").with(
            ensure: 'directory',
            purge: 'false'
          )
        }

        it {
          is_expected.to contain_file("#{lens_dir}/tests").with(
            ensure: 'directory',
            purge: 'true',
            force: 'true'
          ).without(:recurse)
        }
      end

      context 'with a non standard lens_dir' do
        let(:params) do
          {
            lens_dir: '/opt/augeas/lenses',
          }
        end

        it {
          is_expected.to contain_file('/opt/augeas/lenses').with(
            ensure: 'directory',
            purge: 'true',
            force: 'true',
            recurse: 'true',
            recurselimit: 1
          )
        }

        it {
          is_expected.to contain_file('/opt/augeas/lenses/dist').with(
            ensure: 'directory',
            purge: 'false'
          )
        }

        it {
          is_expected.to contain_file('/opt/augeas/lenses/tests').with(
            ensure: 'directory',
            purge: 'true',
            force: 'true'
          ).without(:recurse)
        }
      end
    end
  end
end
