class AtlasObscuraCliApp::CLI
	attr_accessor :continents, :continent, :country, :countries, :destination, :destinations

	def initialize
		@continents = []
		@countries = []
		@destinations = []
	end

	def call
		greeting
		list_continents
		menu
		list_countries(continent)
		menu_2
		list_destinations(country)
		menu_3
		destination_info
		continue
	end

	def greeting
		puts "Search The Atlas!"
		puts "\n"		
	end	

	def list_continents
		if !Continent.all.empty?
			Continent.all.each_with_index do |c, index|
				puts "#{index+1}.  #{c.name}"
			end
		else 
			Continent.create_from_url.each_with_index do |c, index|
				puts "#{index+1}.  #{c.name}"
				self.continents << c     
			end
		end
	end

	def menu
		puts "\n"
		puts "Enter a number for the region you would like to search, list to relist, or exit", "\n"
		input = gets.strip
		if input.slice(/\A\d*/).strip.to_i.eql?(0) || input.slice(/\A\d*/).strip.to_i > self.continents.count + 1  
			menu
		else 
			index = input.slice(/\A\d*/).strip.to_i - 1
			self.continent = self.continents[index]
		end
		puts "\n"
	end		

	def list_countries(continent)
		# binding.pry
		puts continent.name
		puts "\n"
		# call Continents.all instead of scraper
		# AtlasObscuraCliApp::Scraper.scrape_countries(continent).each_with_index do |c, index|
		Country.create_from_url(continent).each_with_index do |c, index|
			puts "#{index+1}.  #{c.name}"
			# binding.pry
			self.countries << c 
		end
	end

	def menu_2
		puts "\n"
		puts "Enter a number for the region you would like to search, list to relist, or exit", "\n"
		input = gets.strip
		if input.slice(/\A\d*/).strip.to_i.eql?(0) || input.slice(/\A\d*/).strip.to_i > self.countries.count + 1  
			menu_2
		else 
			index = input.slice(/\A\d*/).strip.to_i - 1
			self.country = self.countries[index]
		end
		puts "\n"
	end

	def list_destinations(country)
		# binding.pry
		puts country.name
		puts "\n"
		Destination.create_from_url(country).each_with_index do |d, index |
			# binding.pry
			puts "\n"
			puts "#{index+1}.  #{d.name}   -    #{d.city}"
			puts "\n"
			puts "#{d.summary}"
			puts "\n"
			puts "				***"
			self.destinations << d
		end
	end

	def menu_3
		puts "\n"
		puts "Enter a number for the destination you would like to see, list to relist, or exit", "\n"
		input = gets.strip
		if input.slice(/\A\d*/).strip.to_i.eql?(0) || input.slice(/\A\d*/).strip.to_i > self.destinations.count + 1  
			menu_3
		elsif input == "exit"
			goodbye
		else	
			index = input.slice(/\A\d*/).strip.to_i - 1
			self.destination = self.destinations[index]
		end
		puts "\n"
		destination_info
	end	
	
	def destination_info
		puts "#{destination.name}  -  #{destination.city}, #{destination.country.name}"
		puts "\n"
		self.destination.get_text.each {|t| puts t, "\n"}
	end

	def goodbye
		puts "goodbye and good luck"
		exit
	end

	def continue
		puts "Would you like to continue exploring?"
		puts "Make another selection"
		puts "1. Continents"
		puts "2. Other countries in #{self.continent.name}"
		puts "3. Other destinations in #{self.country.name}"
		puts "4. Exit"
		input = gets.strip		
		if !["1", "2","3", "exit"].include?(input)	
			puts "please select a number or exit"
		else
			case input 
			when "1"
				call
			when "2"
				list_countries(self.continent)
			when "3" 		
				list_destinations(self.country)
			when input.downcase == "exit"
				goodbye
			end
		end	
	end		

end # End of Class 