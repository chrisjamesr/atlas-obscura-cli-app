class AtlasObscuraCliApp::CLI
	attr_accessor :continents, :continent, :countries

	def initialize
		@continents = []
		@countries = []
	end

	def call
		list_continents
		menu
		list_countries(self.continent)
	end

	def list_continents
		puts "Search The Atlas!"
		puts "\n"		

		AtlasObscuraCliApp::Scraper.scrape_continents.each_with_index do |c, index| 
			puts "#{index+1}.  #{c.name}"
			self.continents << c     
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
	end		


	def list_countries(continent)
		# binding.pry
		puts continent.name
		puts "\n"
		AtlasObscuraCliApp::Scraper.scrape_countries(continent).each_with_index do |c, index|
			puts "#{index+1}.  #{c.name}"
			self.countries << c 
		end
	end


	def goodbye
		puts "goodbye and good luck"
		exit
	end


end # End of Class 