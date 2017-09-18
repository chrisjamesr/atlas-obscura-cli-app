class Country
	attr_accessor :name, :continent, :cities, ,:url, :destinations

	@@countries = []

	def initialize(name, continent)
		@name = name
		@continent = continent
		@cities = []
		# @destinations = []
		@@countries << self
		self.continent.countries << self

		end

	def self.all
		@@countries
	end

	def add_city(city)
		@cities[city.to_sym] = {}
	end

	def url
		@url = 'http://www.atlasobscura.com/things-to-do/#{self.name}/places' 
	end






end # End of Class