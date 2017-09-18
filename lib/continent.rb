require 'nokogiri'
require 'open-uri'
require 'pry'


class Continent

	attr_accessor :countries, :name
	

@@continents = []

	def initialize(name)
		@name = name
		@countries = []
		@@continents << self
	end

	def self.all
		@@continents
	end

	

	def self.clear_all
		self.all.clear
	end
end # End of Class


