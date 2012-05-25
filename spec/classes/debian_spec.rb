require 'spec_helper'

describe 'augeas::debian', :type => :class do
  let(:title) { 'debian' }
  let(:pre_condition) { 'include augeas::params' }  
  
  describe "With no facts" do
		it { should create_class("augeas::debian") }
		it { should include_class("augeas::params") }
		
		it { should create_file("/usr/share/augeas/lenses/contrib")\
      .with_ensure('directory')\
      .with_owner('root')\
      .with_group('root')\
      .with_mode('0644') }
  end
  
  it { should create_package("augeas-lenses") }
  it { should create_package("libaugeas0") }
  it { should create_package("augeas-tools") }
  it { should create_package("libaugeas-ruby1.8") }
end
