require 'nokogiri'
require 'open-uri'
require 'pry'


class Continent
	attr_accessor :name, :countries
@@continents = {}

	def initialize(name)
		@name = name
		@countries = {}
		@@continents[self] = []
	end

	def self.all
		@@continents
	end

end # End of Class


