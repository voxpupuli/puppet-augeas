require 'spec_helper'

describe 'augeas::gentoo', :type => :class do
  let(:pre_condition) { 'include augeas::params' }  

  describe 'With no facts' do
    it { should create_class('augeas::gentoo') }
    
    it { should include_class('augeas::params') }

    it { should create_file('/usr/share/augeas/lenses/contrib').with({
      'ensure' => 'directory',
      'owner'  => 'root',
      'group'  => 'root',
      'mode'   => '0644',
      })
    }
  end

  it { should contain_package('augeas') }
  
  it { should contain_package('ruby-augeas') }
end
