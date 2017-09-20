require_relative './config/environment.rb'
# require 'bundler/gem_tasks'
# require 'rspec/core/rake_task'
require 'pry'
require 'rake'

# RSpec::Core::RakeTask.new(:spec)

def reload!
	load './lib/atlas_obscura_cli_app.rb'
	load './lib/continent.rb'
	load './lib/country.rb'
	load './lib/destination.rb'
end

task :console => Pry.start 


​# task :default => :spec