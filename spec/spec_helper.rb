require 'rspec-puppet'

RSpec.configure do |c|
  c.manifest_dir = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures'))
  c.module_path = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
end
