begin
  require 'someFile.rb'
rescue LoadError
  puts "someFile.rb was not found, have you"
  puts "forgotten to specify the -I flag?"
  exit
end

Array#each