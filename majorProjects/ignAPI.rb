require "HTTParty"
require "json"


def question(question)
	puts question
	gets.chomp

end

def report_score(title,score)
	case score
	when (8..10)
		puts "You should get this game! It got a #{score}!"
	when (6..7)
		puts "Buy at your own risk, it got a #{score}"
	when (1..5)
		puts "Do not buy ths game! It got a #{score}"
	else
		puts "fucked!"
	end
end


def review(title,score)
	puts "Would you like to leave your own review? Yes or No"
	feedback = gets.chomp.downcase

	case feedback
	when "yes"
		puts "What would you to score the game from 1 to 10"
		user_score = gets.chomp.to_f
		score = user_score
	else
		"Have a good day"
	end

	puts "The new score for #{title} is #{score}!"
end


title = question("What game are you looking for?")


response = HTTParty.get "https://videogamesrating.p.mashape.com/get.php?count=5&game=#{title}",
  headers:{
    "X-Mashape-Key" => "XNQwqu4hekmshAlPjhSjMnEP1s26p1zhJh7jsnEJWKZBRyNpYN",
    "Accept" => "application/json"
  }


body = JSON.parse response.body

first_array = body[0]

title = first_array['title']
score = first_array['score'].to_f



report_score(title, score)
review(title,score)







