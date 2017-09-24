class Continent

	attr_accessor :countries, :name

@@continents = []

	def initialize(name)
		@name = name
		@countries = []
		@@continents << self
	end

	def self.create_from_url
		AtlasObscuraCliApp::Scraper.scrape_continents
	end

	def self.all
		@@continents
	end

	def self.clear
		self.all.clear
	end
	
end # End of Class


