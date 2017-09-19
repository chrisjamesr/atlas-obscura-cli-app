require_relative './lib/atlas_obscura_cli_app.rb'

# require "bundler/gem_tasks"
# require "rspec/core/rake_task"
require 'pry'
require 'rake'

RSpec::Core::RakeTask.new(:spec)

# desc "Open an irb session preloaded with this library"
# task :console do
#   sh "irb -rubygems -I lib -r ./lib/atlas_obscura_cli_app.rb"
# 	end

# task :default => :spec

def reload!
	load './lib/atlas_obscura_cli_app.rb'
	load './lib/continent.rb'
	load './lib/country.rb'
	load './lib/destination.rb'
end
​
task :console 
  Pry.start
end
end




​

