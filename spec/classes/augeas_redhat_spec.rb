require 'spec_helper'

describe 'augeas::redhat', :type => :class do
  let(:title) { 'redhat' }
  let(:pre_condition) { 'include augeas::params' }  
  
  describe "with no facts" do
		it { should create_class("augeas::redhat") }
		it { should include_class("augeas::params") }
		
		it { should create_file("/usr/share/augeas/lenses/contrib")\
      .with_ensure('directory')\
      .with_owner('root')\
      .with_group('root')\
      .with_mode('0644') }
  end
  
  it { should create_package("augeas") }
  it { should create_package("augeas-libs") }
  it { should create_package("ruby-augeas") }
end
