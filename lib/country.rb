class Country
	attr_accessor :name, :continent, :destinations

	@@countries = []

	def initialize(name, continent)
		@name = name
		@continent = continent
		@destinations = {}
		@@countries << self
		self.continent.countries << self

		end

	def self.all
		@@countries
	end





end # End of Class