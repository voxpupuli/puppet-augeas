require 'spec_helper'

describe 'augeas::debian', :type => :class do
  let(:pre_condition) { 'include augeas::params' }  
  
  describe 'With no facts' do
    it { should create_class('augeas::debian') }

    it { should include_class('augeas::params') }

    it { should create_file('/usr/share/augeas/lenses/contrib').with({
      'ensure' => 'directory',
      'owner'  => 'root',
      'group'  => 'root',
      'mode'   => '0644',
      })
    }
  end

  it { should contain_package('augeas-lenses') }

  it { should contain_package('libaugeas0') }

  it { should contain_package('augeas-tools') }

  it { should contain_package('libaugeas-ruby1.8') }
end
