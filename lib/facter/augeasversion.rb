Facter.add("augeasversion") do
  setcode do

    begin
      require 'augeas'
      aug = Augeas::open('', '', Augeas::NO_LOAD & Augeas::NO_STDINC)
      aug.get('/augeas/version') || nil

    rescue LoadError # don't fail if augeas isn't installed
      nil
    end
  end
end
