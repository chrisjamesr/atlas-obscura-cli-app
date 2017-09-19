class City
	attr_accessor :name, :country, :destinations

	def initialize(name, country)
		@name = name
		@country = country
		self.country.add_city(self)
		@destinations = []		
	end

	def add_destinations(array)
		@destinations
	end	




end  # End of Class
