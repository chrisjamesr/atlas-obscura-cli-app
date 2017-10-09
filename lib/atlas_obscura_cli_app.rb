
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
		atlas.css("ul.global-region-list li.global-region-item div[id^=\"#{continent.name.gsub(" ","-").downcase}\"]").search('a').collect do |c| 
			Country.new(c.text.strip, continent)
		end
	end

	# Returns array of destination objects
	def self.scrape_destinations(country)
		# binding.pry
		info = {name: "", link: "", summary: "", city: "", lat_lng: "", country:"", continent:""}
		atlas = Nokogiri::HTML(open(country.url))
		destinations = atlas.css('.geos #page-content .container section.geo-places .index-card-wrap')
		destinations.collect do |dest|
			if !dest.values.include?("index-card-wrap geo-tile-cta")
				info.select do
					info[:name] = dest.search('a h3.content-card-title span').text
					info[:link] = dest.search('a.content-card-place').attribute('href').value
					info[:summary] = dest.search('a .content-card-subtitle').text
					info[:city] = dest.search('a .content-card-text .place-card-location').text # create def name=() to format city name
					info[:lat_lng] = dest.search('a .lat-lng').text.strip
					info[:country] = country
					info[:continent] = country.continent
				end
			end			
			dest = Destination.new(info) 
			scrape_destination_info(dest)
			dest
			# If conditional above is !true returns duplicate Destinaion
		end
	end

	# Returns destination paragraphs as array elements
	def self.scrape_destination_info(destination)
		atlas = Nokogiri::HTML(open(destination.url))
		info = atlas.css('body.places #page-content article.place-content').search('p')
		info.each do |p|
			destination.text << p.text
		end
	end	


end # End of Class

