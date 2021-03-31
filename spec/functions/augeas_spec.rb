require 'spec_helper'

describe 'augeas' do
  let(:aug) { Augeas.open(nil, nil, Augeas::NO_MODL_AUTOLOAD) }

  it { is_expected.not_to eq(nil) }

  it 'fails if the augeas feature is not present' do
    Puppet.features.expects(:augeas?).returns(false)
    is_expected.to run.with_params('', 'Foo.lns', []).and_raise_error(Puppet::ParseError, %r{requires the augeas feature})
  end

  context 'when passing wrong arguments' do
    before :each do
      Puppet.features.stubs(:augeas?).returns(true)
    end

    it 'raises a ParseError if there are no arguments' do
      is_expected.to run.with_params([]).and_raise_error(ArgumentError, %r{expects 3 arguments})
    end

    it 'raises a ParseError if content is not a string' do
      is_expected.to run.with_params(['foo'], 'Fstab.lns', []).and_raise_error(ArgumentError, %r{expects a String value})
    end

    it 'raises a ParseError if lens is not a string' do
      is_expected.to run.with_params('foo', ['Fstab.lns'], []).and_raise_error(ArgumentError, %r{expects a String value})
    end

    it 'raises a ParseError if changes is not an array' do
      is_expected.to run.with_params('foo', 'Fstab.lns', 'changes').and_raise_error(ArgumentError, %r{expects an Array value})
    end
  end

  if Puppet.features.augeas?
    context 'when passing invalid input' do
      it 'fails to parse input with lens' do
        is_expected.to run.with_params('foo', 'Fstab.lns', []).and_raise_error(Puppet::ParseError, %r{Failed to parse string with lens Fstab.lns:})
      end
    end

    context 'when passing illegal changes' do
      it 'fails to apply illegal change' do
        is_expected.to run.with_params("\n", 'Fstab.lns', ['foo bar']).and_raise_error(Puppet::ParseError, %r{Failed to apply change to tree})
      end
    end

    context 'when generating an invalid tree' do
      it 'fails to apply changes with wrong tree' do
        is_expected.to run.with_params("\n", 'Fstab.lns', ['set ./1/opt 3']).and_raise_error(Puppet::ParseError, %r{Failed to apply changes with lens Fstab.lns:})
      end
    end

    context 'when applying valid changes' do
      it 'removes the 3rd option' do
        is_expected.to run
          .with_params("proc        /proc   proc    nodev,noexec,nosuid     0       0\n", 'Fstab.lns', ['rm ./1/opt[3]'])
          .and_return("proc        /proc   proc    nodev,noexec     0       0\n")
      end

      it 'sets a 4th option' do
        is_expected.to run
          .with_params("proc        /proc   proc    nodev,noexec,nosuid     0       0\n", 'Fstab.lns', ['ins opt after ./1/opt[last()]', 'set ./1/opt[last()] nofoo'])
          .and_return("proc        /proc   proc    nodev,noexec,nosuid,nofoo     0       0\n")
      end
    end

    context 'when using old libs' do
      it 'does not work with Augeas prior to 1.0.0' do
        expect(Augeas).to receive(:open).and_return(aug)
        expect(aug).to receive(:get).with('/augeas/version').and_return('0.10.0')
        is_expected.to run.with_params("\n", 'Fstab.lns', []).and_raise_error(Puppet::ParseError, %r{requires Augeas 1\.0\.0})
      end

      it 'does not work with ruby-augeas prior to 0.5.0' do
        expect(Augeas).to receive(:open).and_return(aug)
        expect(aug).to receive(:methods).and_return([])
        is_expected.to run.with_params("\n", 'Fstab.lns', []).and_raise_error(Puppet::ParseError, %r{requires ruby-augeas 0\.5\.0})
      end
    end
  end
end
