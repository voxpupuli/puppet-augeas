# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2 do
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^manifests/(.+)\.pp$})			{ |m| ["spec/classes/#{m[1]}_spec.rb", "spec/defines/#{m[1]}_spec.rb"] }
end

# Add files and commands to this file, like the example:
#   watch(%r{file/path}) { `command(s)` }
#
#guard 'puppet-lint', :watchdir => Guard.options[:watchdir], 
guard 'puppet-lint', :show_warnings => false, 
                     :syntax_check => true \
do
  watch(%r{^manifests/(.+)\.pp$})
  #watch(/(.*).pp$/)
end
