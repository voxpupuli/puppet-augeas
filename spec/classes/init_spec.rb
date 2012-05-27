require 'spec_helper'

describe 'augeas', :type => :class do
  describe 'class with no facts' do
    it { should create_class('augeas') }

    it { should include_class('augeas::params') }

    it { should include_class('augeas::base') }

    it { should_not include_class('augeas::debian') }

    it { should_not include_class('augeas::gentoo') }

    it { should_not include_class('augeas::redhat') }
  end

  describe 'class with OS set to CentOS' do
    let(:facts) { { :operatingsystem => 'CentOS' } }

    it { should create_class('augeas') }

    it { should include_class('augeas::params') }

    it { should include_class('augeas::base') }

    it { should include_class('augeas::redhat') }

    it { should_not include_class('augeas::debian') }

    it { should_not include_class('augeas::gentoo') }
  end

  describe 'class with OS set to Debian' do
    let(:facts) { { :operatingsystem => 'Debian' } }

    it { should create_class('augeas') }

    it { should include_class('augeas::params') }

    it { should include_class('augeas::base') }

    it { should include_class('augeas::debian') }

    it { should_not include_class('augeas::gentoo') }

    it { should_not include_class('augeas::redhat') }
  end

  describe 'class with OS set to Gentoo' do
    let(:facts) { {:operatingsystem => 'Gentoo'} }

    it { should create_class('augeas') }

    it { should include_class('augeas::params') }

    it { should include_class('augeas::base') }

    it { should include_class('augeas::gentoo') }

    it { should_not include_class('augeas::debian') }

    it { should_not include_class('augeas::redhat') }
  end

  describe 'class with too many parameters' do
    let(:params) { { :extra => 'extra' } }

    it 'should throw an error about the extra parameter' do
      expect { should include_class('augeas::params') }\
        .to raise_error(Puppet::Error, /Invalid parameter extra/)
    end
  end
end
