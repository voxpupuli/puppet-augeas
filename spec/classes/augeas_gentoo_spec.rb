require 'spec_helper'

describe 'augeas::gentoo', :type => :class do
  let(:title) { 'gentoo' }
  let(:pre_condition) { 'include augeas::params' }  
  
  describe "With no facts" do
		it { should create_class("augeas::gentoo") }
		it { should include_class("augeas::params") }
		
		it { should create_file("/usr/share/augeas/lenses/contrib")\
      .with_ensure('directory')\
      .with_owner('root')\
      .with_group('root')\
      .with_mode('0644') }
  end
  
  it { should create_package("augeas") }
  it { should create_package("ruby-augeas") }
end
