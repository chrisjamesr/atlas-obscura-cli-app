
class Destination
	attr_accessor :name, :link, :summary, :city, :lat_lng, :country, :continent
	# {name: "", link: "", summary: "", city: "", lat_lng: "", country: self}
	@@destinations
	
	def initialize(info_hash)
		info_hash.each {|key, value| self.send(("#{key}="), value)}
		@@destinations << self

	end

	
end  # End of Class