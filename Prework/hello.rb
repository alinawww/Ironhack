puts "What's your name?"
name = gets.chomp
puts "What's your wishlist?"
wishlist = gets.chomp
IO.write('name.txt', wishlist)