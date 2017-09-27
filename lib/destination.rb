
class Destination
	attr_accessor :name, :link, :summary, :lat_lng, :country, :continent, :city, :text
	
	# {name: "", link: "", summary: "", city: "", lat_lng: "", country: self}
	@@destinations = []
	
	def initialize(info_hash)
		info_hash.each do |key, value| 
			self.send(("#{key}="), value)
		end	
		@@destinations << self
		self.country.destinations << self
		@text = []
	end

	def self.create_from_url(country)
		AtlasObscuraCliApp::Scraper.scrape_destinations(country).uniq {|c| c.name}
	end

	def self.all
		@@destinations
	end

	def self.destination_names
		self.all.collect {|d| d.name}
	end
		
	def self.clear_all
		self.all.clear
	end

	def country_name
		self.country.name
	end
	
	def continent_name
		self.continent.name
	end		

	def city
		@city.sub(", #{self.country.name}", "")
	end

	def url
		"http://www.atlasobscura.com/#{self.link}"
	end


	def get_text
		AtlasObscuraCliApp::Scraper.scrape_destination_info(self)
		self.text
	end
	
	def text
		@text
	end


end  # End of Class