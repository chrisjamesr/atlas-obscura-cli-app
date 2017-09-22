Atlas Obscura destination scraper

Investigate moving object construction from scraper to create_from ... object class method.


separation of concerns


scraper scrapes data and creates objects (look into object constructor methods)
objects store data
cli -> calls objects for info

Take some time and think this through!

scrape destinations page,
populate list of continents
create continents objects
select continent

populate list of countries
create countries object
select country
populate list of destinations
create destinations object
select destination


continents
url = 'http://www.atlasobscura.com/destinations'

atlas = Nokogiri::HTML(open(url))

continent = atlas.css('ul.global-region-list li.global-region-item').search('h2').text
 places.each{|a| a.search('h2').text}

countries

continent.css(.collapsible.js-toggle.js-global-region.toggle .drawer-content-wrap .country-links .baseline-near .js-row-member).search('a')

 atlas.css('ul.global-region-list li.global-region-item').search('a').each { |a| puts a.text}

atlas.css("ul.global-region-list li.global-region-item #asia-children").first.search('a').each{|a| puts a.text}

destinations

 city/link
  nodes = atlas.css('.geos #page-content .container section.geo-places .index-card-wrap')

  link = nodes.search('a.content-card-place').each {|c| puts c.attribute('href').value}

  blurb = nodes.search('a .content-card-subtitle').each {|c| puts c.text}

  lat_lng = nodes.search('a .lat-lng').each {|c| puts c.text.strip}

  country = nodes.search('.content-card-footer-container')
  .each {|c| c.children[-2]attribute('data-place-country').value}

  (city,country)
  city = nodes.search('a .content-card-text .place-card-location').each {|c| puts c.text}
 
  attraction = nodes.search('a h3.content-card-title span').each {|c| puts c.text} 





atlas.css('.page content .container section.geo-places a.content-card-place').attribute('href').value

city = atlas.css('.page content .container section.geo-places a.content-card-place .content-card-text').search('place-card-location').text

attraction = atlas.css('.content-card-text').search('h3.content-card-title span').text

blurb = city.search('.content-card-subtitle')

geo = atlas.css('.content-card-text').search('.lat-lng') 



destination text

'.page-content article.place-content #place-container .content-body').search('p').text




data scructure
 continents = {
 	:africa => {
		:name => name,
		:countries => {
			:country1 => {
				:name => name
				:destinations => {
					destination1 ={
						:name => name
						:country => country
						:continent => continent
						:description => text
					},
					destination2 ={
						:name => name
						:country => country
						:continent => continent
						:description => text
					}
				}
			},
			:country2 => {
				:name => name
				:destinations => {
					destination1 ={
						:name => name
						:country => country
						:continent => continent
						:description => text
					},
					destination2 ={
						:name => name
						:country => country
						:continent => continent
						:description => text
					}
				}
			}
		}	
	}
}	