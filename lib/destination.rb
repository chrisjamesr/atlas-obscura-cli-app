
class Destination
	attr_accessor :name, :country, :continent, :description 
	
	@@destinations
	
	def initialize(info_hash)
		info_hash.each {|key, value| self.send(("#{key}="), value)}
		@@destinations << self
	end

	
end  # End of Class