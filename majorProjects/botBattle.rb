def rival()

	puts "We got a couple of bots here..pick one to fight!"
	puts "1) GREENBOT"
	puts "2) BLUEBOT"
	puts "3) REDBOT"
	puts "Type: Greenbot, Bluebot, or Redbot below"
	print ">  "
	rival = gets.chomp.upcase
	puts "#{rival} powers up!"
	return rival
end

def rival_health(rival)

	case rival
	when 'GREENBOT'
		rival_health = Random.new
		rival_health = rival_health.rand(5..8)
		rival_health = rival_health + 2
		puts "#{rival}'s health is: #{rival_health}"
		return rival_health
	when 'BLUEBOT'
		rival_health = Random.new
		rival_health = rival_health.rand(5..7)
		rival_health = rival_health + 2
		puts "#{rival}'s health is: #{rival_health}"
		return rival_health
	when 'REDBOT'
		rival_health = Random.new
		rival_health = rival_health.rand(5..6)
		rival_health = rival_health + 2
		puts "#{rival}'s health is: #{rival_health}"
		return rival_health
	end
end

def rival_power(rival)
	case rival
	when 'GREENBOT'
		rival_power = Random.new
		rival_power = rival_power.rand(4..6)
		puts "#{rival}'s power is: #{rival_power}"
		return rival_power
	when 'BLUEBOT'
		rival_power = Random.new
		rival_power = rival_power.rand(4..7)
		rival_power = rival_power + 1
		puts "#{rival}'s power is: #{rival_power}"
		return rival_power
	when 'REDBOT'
		rival_power = Random.new
		rival_power = rival_power.rand(5..6)
		rival_power = rival_power + 2
		puts "#{rival}'s power is: #{rival_power}"
		return rival_power
	end
end

def combat(user_health, user_power, rival, rival_power,rival_health)
	puts "You enter the ring, sweat pours down your face..."
	puts "You have 20 rounds to kill your rival, Good Luck!"
	puts "The bell rings.."

	dodge_counter = 0  									# Keeps track of how many times you dodge
	round_counter = 0									# Initiate Round counter
	score		  = 0									# Initiate Score counter

		while(user_health > 0 && rival_health != 0)
		round_counter += 1 							# Increments round counter
			if round_counter > 20					# If round counter exceeds 20, exit program, user loses
				puts "You've run of rounds! You Lose!"
				score = 0
				puts "Your score: #{score}"
				exit(0)
			end
		puts " ***************************************************** "
		puts "Round: #{round_counter}"
		puts "#{rival}'s Health: #{rival_health}"
		puts "Your Health: #{user_health}"
		puts "Attack or Dodge? Type A or D below:"
		print "> "
		# User chooses an action
		user_choice = gets.chomp.upcase
		if (user_choice == "A")
			user_attack = Random.new
			user_attack = user_attack.rand(2..4)
			user_attack += user_power # User attack
			puts "Attack Power: #{user_attack}"
		elsif(user_choice == "D")
			puts "Getting ready to move!"
			# dodge counter keeps track of how many times you've dodged
			dodge_counter += 1
			health_bonus = Random.new
			health_bonus = health_bonus.rand(1..5)
				if health_bonus >=3 && dodge_counter < 3 		# Provides a bonus of 1 health within three dodges
					user_health += 1
					puts " !!!!!!!!!!!!!!!!!!! "
					puts "You've gained a bit of health!"
					puts "Health: #{user_health}"
					puts " !!!!!!!!!!!!!!!!!!! "
				elsif dodge_counter >= 3
					puts "You're dodging too much! Let's see some hits!"
					dodge_counter = 0
				else
					puts "Something has gone horribly wrong! Hit Him!"
				end				
		end

		rival_choice = Random.new
		# 1  = ATTACK // 2 = DODGE 
		rival_choice = rival_choice.rand(1..2) #Bot randomly selects attack or dodge

		if rival_choice == 1
			rival_attack = rival_power
		end

		# COMBAT LOGIC
		# REMEMBER: 
		# rival_choice == 1 => ATTACK // rival_choice == 2 => DODGE
		# user_choice == "A"=> ATTACK // user_choice == "D"=> DODGE

			if (user_choice == "A" && rival_choice == 2)
				puts "#{rival} dodges your attack!"
			elsif (user_choice == "D" && rival_choice == 1)
				puts "You dodged #{rival}'s attack!"
				score += 1
			elsif(user_choice == "D" && rival_choice == 2)
				puts "You both dance around each other!"
				puts "Come on, lets see some action!"
			elsif((user_choice == "A" && rival_choice == 1) && (user_attack > rival_attack)) # Both user and Rival chose attack
				puts "You hit #{rival}"
				rival_health -= 1
				counter = Random.new
				counter = counter.rand(1..5)
					# Allows A.I. to counter sometimes.
					if counter >= 3
						puts "Oh no! #{rival} counters with a punch of his own!"
						user_health -= 1
					end
				puts "#{rival} is at #{rival_health} health!"
				score += 1
			elsif((user_choice == "A" && rival_choice == 1) && (rival_attack > user_attack)) # Both user and Rival chose attack
				puts "#{rival} hits you in the face!"
				user_health -= 1
				puts "You're at #{user_health} health!"
				score -= 1
			elsif((user_choice =="A" && rival_choice == 1) && (user_attack == rival_attack))
				puts "You both hit each other!"
				user_health -= 1
				rival_health -= 1
				puts "You are at #{user_health} and #{rival} is at #{rival_health}"
				score += 1
			else
				puts "I dont know!"
			end

			# Win/Death Condition
			if rival_health == 0 && user_health >= 1
				puts "You defeated #{rival}!"
				puts "Your score: #{score}"
					boss(score,rival)  					# You defeat the Bot and transfer to the Boss Battle!
			elsif user_health == 0 && rival_health >= 1
				puts "You have been killed by #{rival}!"
				score = 0
				puts "Your score: #{score}"
			end
		end
end


def boss(score,rival) # ADD ROUNDS!! and ADD HEALTH BONUS!
	puts "BossMan: You destroyed #{rival}!"
	puts "Alright buddy...now you really pissed me off...I'm gonna tear you limb from limb!"
	puts "BossMan puts on a power suit!"
	sleep(2)

	user_health = 8
	user_power = 8
	dodge_counter = 0
	round_counter = 0

	boss_health = Random.new
	boss_health = boss_health.rand(10..15)
	boss_power = Random.new
	boss_power = boss_power.rand(8..10)

	puts "You hear a whisper from the crowd...psst..psst..Hey Buddy!"
	sleep(2)
	puts "Load this chip into your Neural-Net processor...it'll update your moves!"
	puts "You don't really trust this old geezer...but what do you got to lose!?"
	sleep(1)
	puts "Loading..."
	sleep(1)
	puts "Loading..."
	sleep(1)
	puts "Upload complete! Updated Move List: "
	puts "High Attack => HA, Low Attack => LA, Dodge => D"
	sleep(1)
	puts "Time to do this!"
	puts "You have 60 rounds to kill the boss!"
		while(user_health > 0 && boss_health != 0)
			round_counter += 1 							# Increments round counter
			if round_counter > 60					# If round counter exceeds 40, exit program, user loses
				puts "You've run of rounds! You Lose!"
				score = 0
				puts "Your score: #{score}"
				exit(0)
			end

			puts "******************************"
			puts "Round: #{round_counter}"
			puts "BossMan's Health: #{boss_health}"
			puts "Your Health: #{user_health}"
			puts "High Attack, Low Attack, or Dodge? Put: HA, LA, or D below:"
			print "> "

			user_choice = gets.chomp.upcase


			boss_choice = Random.new
			boss_choice = boss_choice.rand(1..10)
				case boss_choice
				when (1..2)
					boss_choice = "HA"
				when (3..5)
					boss_choice = "LA"
				when (6..8)
					boss_choice = "D"
				when (9..10)
					boss_choice = "S"
				else
					puts "Something Bad"
				end

				# COMBAT LOGIC
				if boss_choice == "S"
					puts "BossMan used his special! He flies up and hits you with rocket punch!"
					puts "That was for #{rival}!"
					user_health -= 1
					score -= 1
				elsif boss_choice == "HA" && user_choice == "LA"
					puts "BossMan tries to hit your face!"
					puts "You counter BossMan's high attack!"
					boss_health -= 1
					score += 1
				elsif boss_choice == "LA" && user_choice == "HA"
					puts "BossMan tries to go for your legs!"
					puts "You counter BossMan's low attack!"
					boss_health -= 1
					score += 1
				elsif (boss_choice == "D" && user_choice == "D") 
					puts "You both dodged each other!"
				elsif boss_choice == "D"
					puts "BossMan dodges your attack!"
					# dodge counter keeps track of how many times you've dodged
				elsif user_choice == "D"
					puts "You dodged BossMan's attack!"
					dodge_counter += 1
					health_bonus = Random.new
					health_bonus = health_bonus.rand(1..5)
						if health_bonus >=3 && dodge_counter < 3 		# Provides a bonus of 1 health within three dodges
							user_health += 1
							puts " !!!!!!!!!!!!!!!!!!! "
							puts "You've gained a bit of health!"
							puts "Health: #{user_health}"
							puts " !!!!!!!!!!!!!!!!!!! "
						elsif dodge_counter >= 3
							puts "You're dodging too much! Let's see some hits!"
							dodge_counter = 0
						else
							puts "Something has gone horribly wrong! Hit Him!"
						end	
				elsif ((boss_choice == "LA" && user_choice == "LA") && (user_power > boss_power))
					puts "You hit BossMan!"
					boss_health -= 1
					score += 1
				elsif ((boss_choice == "LA" && user_choice == "LA") && (boss_power > user_power))
					puts "BossMan hits you!"
					user_health -= 1
					score -= 1
				elsif ((boss_choice == "HA" && user_choice == "HA") && (user_power > boss_power))
					puts "You hit BossMan!"
					boss_health -= 1
					score += 1
				elsif ((boss_choice == "HA" && user_choice == "HA") && (boss_power > user_power))
					puts "BossMan hits you!"
					user_health -= 1
					score -= 1
				else
					puts "I dunno what happened!"
				end

				if boss_health == 0 && user_health >= 1
				puts "You defeated BossMan!!"
				puts "Your score: #{score}"
					boss(score,rival)
				elsif user_health == 0 && boss_health >= 1
				puts "You have been killed by BossMan!"
				score = 0
				puts "Your score: #{score}"
				end

		end
end


# BEGIN PROGRAM!

puts "\t\t\t\t\t\tWelcome to Bot Boxing"
puts <<END 

END

puts "You wake up in a room surrounded by a small crowd of onlookers"
puts "A man blows a puff a smoke in your face...and says: 'You're the lucky winner, now you gotta fight!' "

# User base stats
user_health = 5
user_power = 5

rival = rival()
rival_power = rival_power(rival)
rival_health = rival_health(rival)

puts "You're power: #{user_power}"
puts "You're health: #{user_health}"


puts "TIME TO FIGHT!"


combat(user_health, user_power, rival, rival_power, rival_health)







