class Country
	attr_accessor :name, :continent, :url, :destinations

	@@countries = []

	def initialize(name, continent)
		@name = name
		@continent = continent
		@destinations = []
		@@countries << self
		self.continent.countries << self
	end

	def self.all
		@@countries
	end

	def self.clear_all
		self.all.clear
	end

	def self.create_from_url(continent)
		AtlasObscuraCliApp::Scraper.scrape_countries(continent)
	end

	def url
		@url = "http://www.atlasobscura.com/things-to-do/#{self.name.gsub(" ","-").gsub(".","").downcase}/places"
	end

end # End of Class