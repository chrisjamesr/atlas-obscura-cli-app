require 'nokogiri'
require 'open-uri'

require_relative './atlas_obscura_cli_app/version'
require_relative './atlas_obscura_cli_app/cli'
require_relative './continent'
require_relative './country'

class AtlasObscuraCliApp::Scraper

	def initialize()
	end

	# returns hash of continents on site
	def self.scrape_continents
		atlas = Nokogiri::HTML(open('http://www.atlasobscura.com/destinations'))
		atlas.css('ul.global-region-list li.global-region-item').search('h2').collect do |c|
			Continent.new(c.text.strip)
		end
	end

	def self.scrape_countries(continent)
		atlas = Nokogiri::HTML(open('http://www.atlasobscura.com/destinations'))
		atlas.css("ul.global-region-list li.global-region-item div[id^=\"#{continent.name.downcase}\"]").search('a').collect do |c| 
			# doc.css('span[class="#{k}"]')
			Country.new(c.text.strip, continent)
		end
	end

	def self.scrape_destinations
	end
end # End of Class

