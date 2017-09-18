#CLI Controller
class AtlasObscuraCliApp::CLI

	def call
		list_continents
		menu
	end

	def list_continents
		puts "Search The Atlas"
		# list_continents || choose random
		puts <<-DOC.gsub(/^\s*/, '')
		1.  Africa
		2.  Antarctica 
		3.  Asia
		4.  Caribbean
		5.  Central America
		6.  Europe
		7.  Middle East
		8.  North America
		9.  Oceania
		10. South America 

		DOC
	end

	def menu
		puts "Enter the area you would like to search, list for areas or exit", "\n"
		input = nil
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

	def goodbye
		puts "goodbye and good luck"
		exit
	end


end # End of Class 