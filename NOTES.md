Atlas Obscura destination scraper


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