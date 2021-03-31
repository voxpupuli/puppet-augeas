# @summary
#   Modifies a string using Augeas.
#
# *Example:*
#
#    augeas("proc        /proc   proc    nodev,noexec,nosuid     0       0
# ", 'Fstab.lns', ['rm ./1/opt[3]'])
#
# Would result in:
#
#    "proc        /proc   proc    nodev,noexec     0       0
# "
#
Puppet::Functions.create_function(:augeas) do
  # @param content
  #   The string to modify.
  #
  # @param lens
  #   The lens to use for parsing.
  #
  # @param changes
  #   An array of changes to apply to the string.
  #
  # @return [String]
  #   The resulting string.
  #
  dispatch :apply_changes do
    param 'String', :content
    param 'String', :lens
    param 'Array[String]', :changes
  end

  def apply_changes(content, lens, changes)
    unless Puppet.features.augeas?
      raise Puppet::ParseError, 'augeas(): this function requires the augeas feature. See http://projects.puppetlabs.com/projects/puppet/wiki/Puppet_Augeas#Pre-requisites for how to activate it.'
    end

    require 'augeas'
    aug = Augeas.open(nil, nil, Augeas::NO_MODL_AUTOLOAD)
    augeas_version = aug.get('/augeas/version')
    raise(Puppet::ParseError, 'augeas(): requires Augeas 1.0.0 or greater') unless Puppet::Util::Package.versioncmp(augeas_version, '1.0.0') >= 0
    raise(Puppet::ParseError, 'augeas(): requires ruby-augeas 0.5.0 or greater') unless aug.methods.include?(:text_store)

    result = nil
    begin
      aug.set('/input', content)
      aug.text_store(lens, '/input', '/store')
      unless aug.match('/augeas/text/store//error').empty?
        error = aug.get('/augeas/text/store//error/message')
        raise Puppet::ParseError, "augeas(): Failed to parse string with lens #{lens}: #{error}"
      end

      # Apply changes
      aug.context = '/store'
      changes.each do |c|
        r = aug.srun(c)
        raise Puppet::ParseError, 'augeas(): Failed to apply change to tree' unless r && r[0] >= 0
      end
      unless aug.text_retrieve(lens, '/input', '/store', '/output')
        error = aug.get('/augeas/text/store//error/message')
        raise Puppet::ParseError, "augeas(): Failed to apply changes with lens #{lens}: #{error}"
      end
      result = aug.get('/output')
    ensure
      aug.close
    end
    result
  end
end
