class AtlasObscuraCliApp::CLI
	attr_accessor :continents, :continent, :country, :countries, :destination, :destinations

	def initialize
		@continents = []
		@countries = []
		@destinations = []
	end

	def call
		list_continents
		menu
		list_countries(continent)
		menu_2
		list_destinations(country)
		menu_3
		list_destination_info(destination)
	end

	def list_continents
		puts "Search The Atlas!"
		puts "\n"		
		# call Continents.all instead of scraper
		AtlasObscuraCliApp::Scraper.scrape_continents.each_with_index do |c, index| 
			puts "#{index+1}.  #{c.name}"
			self.continents << c     
		end
	end

	#refactor menu methods for 
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
		Continent.all.each_with_index do |c, index|
			puts "#{index+1}.  #{c.name}"
			binding.pry
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
		AtlasObscuraCliApp::Scraper.scrape_destinations(country).each_with_index do |d, index |
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
		if input.slice(/\A\d*/).strip.to_i.eql?(0) || input.slice(/\A\d*/).strip.to_i > self.countries.count + 1  
			menu_3
		elsif input == "exit"
			goodbye
		else	
			index = input.slice(/\A\d*/).strip.to_i - 1
			self.destination = self.destinations[index]
		end
		puts "\n"
		list_destination_info(self.destination)
		puts "\n"
		puts "Would you like to see another destination? type list or exit", "\n"
		menu_3
	end	
	# scraper hasn't been called, destination.text = []
	def list_destination_info(destination)
		binding.pry
		destination.text.each do |p|
			puts p
			puts "\n"
		end
	end

	def goodbye
		puts "goodbye and good luck"
		exit
	end


end # End of Class 