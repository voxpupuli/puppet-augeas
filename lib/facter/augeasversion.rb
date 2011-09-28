Facter.add("augeasversion") do
  setcode do
    begin
      require 'augeas'
      if Augeas.const_defined?("NO_LOAD") && Augeas.const_defined?("NO_STDINC")
        aug = Augeas::open('', '', Augeas::NO_LOAD & Augeas::NO_STDINC)
      elsif Augeas.const_defined?("NONE")
        aug = Augeas::open('', '', Augeas::NONE)
      else
        nil
      end
      
      aug.get('/augeas/version') || nil

    rescue LoadError # don't fail if augeas isn't installed
      nil
    end
  end
end
