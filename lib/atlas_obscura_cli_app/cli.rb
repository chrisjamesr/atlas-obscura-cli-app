class AtlasObscuraCliApp::CLI
	attr_accessor :continents

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
	end


	def menu
		puts "\n"
		puts "Enter the continent (or number) you would like to search, list to relist, or exit", "\n"
		input = gets.strip
		

		while input != "exit"
			case input = gets.strip
			when "1"
				puts "more info on 1"
			when "2"
				puts "more info on 2"
			when "3"
				puts "more info on 3"
			when "4"
				puts "more info on 4"
			when "5"
				puts "more info on 5"
			when "6"
				puts "more info on 6"
			when "7"
				puts "more info on 7"
			when "8"
				puts "more info on 8"
			when "9"
				puts "more info on 9"
			when "10"
				puts "more info on 10"
			when "11"
				puts "more info on 11"	
			when "list"
				list_continents
			else
				puts "not sure what you're looking for, type list"	
			end
		end
	end

	def list_countries(continent)


	def goodbye
		puts "goodbye and good luck"
		exit
	end


end # End of Class 