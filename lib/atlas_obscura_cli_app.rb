require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './atlas_obscura_cli_app/version'
require_relative './atlas_obscura_cli_app/cli'
require_relative './continent'
require_relative './country'
require_relative './destination'

class AtlasObscuraCliApp::Scraper

	def initialize()
	end

	# returns array of continents on site
	def self.scrape_continents
		atlas = Nokogiri::HTML(open('http://www.atlasobscura.com/destinations'))
		atlas.css('ul.global-region-list li.global-region-item').search('h2').collect do |c|
			Continent.new(c.text.strip)
		end
	end
	# returns array of countries
	def self.scrape_countries(continent)
		atlas = Nokogiri::HTML(open('http://www.atlasobscura.com/destinations'))
		atlas.css("ul.global-region-list li.global-region-item div[id^=\"#{continent.name.downcase}\"]").search('a').collect do |c| 
			Country.new(c.text.strip, continent)
		end
	end

	def self.scrape_destinations(country)
		info = {name: "", link: "", summary: "", city: "", lat_lng: "", country:"", continent:""}
		atlas = Nokogiri::HTML(open(country.url))
		destinations = atlas.css('.geos #page-content .container section.geo-places .index-card-wrap').pop
		destinations.each do |dest|
			# binding.pry
			dest.pop
			info.each do
				info[:name] = dest.search('a h3.content-card-title span').text
				info[:link] = dest.search('a.content-card-place').attribute('href').value
				info[:summary] = dest.search('a .content-card-subtitle').text
				info[:city] = dest.search('a .content-card-text .place-card-location').text # create def name=() to format city name
				info[:lat_lng] = dest.search('a .lat-lng').text.strip
				info[:country] = country
				info[:continent] = country.continent
			end
			binding.pry
			Destination.new(info)
		end
		# atlas.each do {|a| Destination.new(a)}
	end

end # End of Class

