require 'spec_helper'

describe 'wrong_os' do
  let (:facts) { {
    :osfamily => 'MS-DOS'
  } }

  it 'should fail' do
    expect { should contain_package('ruby-augeas') }.to raise_error(Puppet::Error, /Unsupported OS family/)
  end
end
