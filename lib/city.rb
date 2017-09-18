class City
	attr_accessor :name, :country, :destinations

	def initialize(name, country)
		@name = name
		@country = country
		self.country.add_city(self)
		@destinations = []
	end

	def destinations 




end  # End of Class
