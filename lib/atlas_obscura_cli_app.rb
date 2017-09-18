require_relative './atlas_obscura_cli_app/version'
require_relative './atlas_obscura_cli_app/cli'
require_relative './continent'

class AtlasObscuraCliApp::Scraper

	def initialize()
	end

	# returns hash of continents on site
	def self.scrape_continents
		atlas = Nokogiri::HTML(open('http://www.atlasobscura.com/destinations'))
		atlas.css('ul.global-region-list li.global-region-item').search('h2').collect do |c|
			Continent.new(c.text.strip.to_sym)
		end
	end

end # End of Class