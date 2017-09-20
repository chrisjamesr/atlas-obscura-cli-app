class AtlasObscuraCliApp::CLI
	attr_accessor :continents, :countries

	def initialize
		@continents = []
	end

	def call
		list_continents
		menu
	end

	def list_continents
		puts "Search The Atlas!"
		puts "\n"		

		AtlasObscuraCliApp::Scraper.scrape_continents.each_with_index do |c, index| 
			puts "#{index+1}.  #{c.name}"
			self.continents << c     
		end
		binding.pry
	end


	def menu
		puts "\n"
		puts "Enter a number for the continent you would like to search, list to relist, or exit", "\n"
		input = gets.strip
		if input.slice(/\A\d*/).strip.to_i.eql?(0) || input.slice(/\A\d*/).strip.to_i > self.continents.count + 1  
			menu
		else 
			index = input.slice(/\A\d*/).strip.to_i - 1
			self.country = self.continents[index].name


	def list_countries(continent)
		
	end


	def goodbye
		puts "goodbye and good luck"
		exit
	end


end # End of Class 