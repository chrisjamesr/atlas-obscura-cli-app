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



url = 'http://www.atlasobscura.com/destinations'

atlas = Nokogiri::HTML(open(url))

atlas.css('ul.global-region-list li.global-region-item').search('h2').text


 places.each{|a| a.search('h2').text}

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