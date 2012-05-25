require 'spec_helper'

describe 'augeas::base', :type => :class do
  let(:title) { 'base' }
  let(:pre_condition) { 'include augeas::params' }  
  
  describe "With no facts" do
		it { should create_class("augeas::base") }
		it { should include_class("augeas::params") }
		
		it { should create_file("/usr/share/augeas/lenses/contrib")\
      .with_ensure('directory')\
      .with_owner('root')\
      .with_group('root')\
      .with_mode('0644') }
  end
end
