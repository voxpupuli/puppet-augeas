require 'spec_helper'

describe 'with_lens_noaugeas' do
  it 'should error' do
    expect {
      should contain_file('/usr/share/augeas/lenses/foo.aug')
    }.to raise_error(Puppet::Error, /You must declare the augeas class/)
  end
end
