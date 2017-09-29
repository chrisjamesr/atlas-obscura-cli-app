class AtlasObscuraCliApp::CLI
	attr_accessor :continents, :continent, :country, :countries, :destination, :destinations, :switch

	def initialize
		@continents = []
		@countries = []
		@destinations = []
	end

	def call(switch=nil)
		input = nil
		greeting
		list_continents
		menu
		switch = self.switch
	  until switch == "exit"	
			case self.switch
			when :countries
				list_countries(self.continent)
			when :destinations	
				list_destinations(self.country)
			when :destination
				destination_info
				continue
			when :continents
				list_continents	
			end
			menu
		end
	end

	def greeting
		puts "\n"		
		puts "Search The Atlas!"
		puts "\n"		
	end	

	def menu(switch=self.switch)
	puts "\n"
	puts "Enter a number for the #{switch.to_s.capitalize} you would like to search, list to relist, or exit", "\n"
	input = gets.strip
		if input.downcase == "exit"
			goodbye
		elsif input.downcase == "list"
			self.send("list_"+"#{switch}")
			menu
		elsif 
			input.to_i == 0 || input.to_i > self.send("#{switch}").count + 1  
			menu
		elsif
			case switch
			when :continents
				index = input.to_i - 1
				self.continent = self.continents[index]
				self.switch = :countries
			when :countries	
				index = input.to_i - 1
				self.country = self.countries[index]
				self.switch = :destinations
			when :destinations
				index = input.strip.to_i - 1
				self.destination = self.destinations[index]	
				self.switch = :destination				
			end
			puts "\n"
		end	
	end	
	
	def list_continents
		Continent.all.each_with_index do |c, index|
			puts "#{index+1}.  #{c.name}"
			self.continents << c     
		end
		self.switch = :continents
	end

	def list_countries(continent=self.continent)
		clear_countries
		puts continent.name
		puts "\n"
		Country.create_from_url(continent).each_with_index do |c, index|
			puts "#{index+1}.  #{c.name}"
			self.countries << c 
		end
		self.switch = :countries
	end

	def list_destinations(country=self.country)
		clear_destinations
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
		self.switch = :destinations
	end

		def destination_info
		puts "#{destination.name}  -  #{destination.city}, #{destination.country.name}"
		puts "\n"
		self.destination.get_text.each {|t| puts t, "\n"}
	end

	def goodbye
		puts "\n"
		puts "Goodbye and Good luck"
		sleep(1)	
		self.switch = "exit"
		exit
	end

	def continue
		puts "Would you like to continue exploring?"
		puts "Make another selection"
		puts "1. List Continents"
		puts "2. Other countries in #{self.continent.name}"
		puts "3. Other destinations in #{self.country.name}"
		puts "4. Exit"
		puts "\n"		
		input = nil
		while !["1", "2", "3", "4", "exit"].include?(input)	
			input = gets.strip		
			if input.downcase == "exit" || input.downcase == "4"
				goodbye
			else		
				case input 
				when "1"
					self.switch = :continents
					call
				when "2"
					self.switch = :countries
					list_countries(self.continent)
				when "3" 		
					self.switch = :destinations
					list_destinations(self.country)
				else
					puts "Please enter a valid number"
				end	
			end
		end	
	end	

	def clear_countries
		self.countries.clear
	end
	
	def clear_destinations
		self.destinations.clear	
	end	

end # End of Class 