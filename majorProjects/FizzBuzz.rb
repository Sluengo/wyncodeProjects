#Very Fizzy, Very Awesome...
# A Program designed to FizzBuzz any range of numbers and and look for multiple of any given number
class FizzBuzzer

	def start

		intro

		get_numbers

		calculate_fizz_buzz
	end

	def intro
		puts "Welcome to the Fizz Buzzer App!"
		puts "This program automates one of the most common programming questions!"
		puts "Just plug in the numbers and let my program handle the rest!"
		sleep(1)
		puts "Loading..."
		sleep(1)
		puts "Loading..."
		sleep(2)
	end

	def get_numbers
		puts "Where would you like to start the range of numbers to search through?"
		@start_range = gets.chomp.to_i
		puts "Where would you like to end the range of numbers to search through?"
		@end_range = gets.chomp.to_i

		puts "What number would you like to Fizz?"
		@fizz = gets.chomp.to_i

		puts "What number would you like to Buzz?"
		@buzz = gets.chomp.to_i
	end

	def calculate_fizz_buzz
		(@start_range..@end_range).each do |number|
			if(number % @fizz == 0) && (number % @buzz == 0)
				puts "FizzBuzz"
			elsif number % @buzz == 0
				puts "Buzz"
			elsif (number % @fizz == 0) 
				puts "Fizz"
			else
				puts number
			end
		end
	end


end


test_one = FizzBuzzer.new
test_one.start
