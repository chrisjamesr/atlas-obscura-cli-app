
class Destination
	attr_accessor :name, :link, :summary, :lat_lng
	attr_writer :country, :continent, :city
	# {name: "", link: "", summary: "", city: "", lat_lng: "", country: self}
	@@destinations = []
	
	def initialize(info_hash)
		info_hash.each {|key, value| self.send(("#{key}="), value)}
		@@destinations << self
	end

	def self.all
		@@destinations
	end

	def country_name
		self.country.name
	end
	
	def continent_name
		self.continent.name
	end		

	def city
		@city.sub("#{country.name}", "")
	end

	
end  # End of Class