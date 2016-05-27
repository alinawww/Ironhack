puts "What is your name?"
name = gets.chomp
length = 5

if name.length < length
    puts "Hi #{name}! That's a nice short name"
end

puts "Do you wanna play a game?"
game_choice = gets.chomp

if game_choice == "Yes"
    puts "Great! Let's start."
elsif game_choice == "No"
    puts "Bummer... :("
else
    puts "I'm not sure what you want to do"
end
