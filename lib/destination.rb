
class Destination
	attr_accessor :name, :link, :summary, :city, :lat_lng
	attr_reader :country, :continent
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

	
end  # End of Class