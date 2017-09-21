
class Destination
	attr_accessor :name, :link, :summary, :lat_lng, :country, :continent, :city
	
	# {name: "", link: "", summary: "", city: "", lat_lng: "", country: self}
	@@destinations = []
	
	def initialize(info_hash)
		info_hash.each do |key, value| 
			# binding.pry
			self.send(("#{key}="), value)
			# self.send(("#{key}="), value.is_a?(String) ? value : value.name)
		end	
		@@destinations << self
		self.country.destinations << self
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