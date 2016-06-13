class Home
  attr_reader :name, :city, :rooms, :colour, :price
  def initialize (name, city, rooms, colour, price)
    @name = name
    @city = city
    @rooms = rooms
    @colour = colour
    @price = price
  end
end

houses = [
  Home.new("Alina's house", "Bucharest", 4, "Turqoise", 300),
  Home.new("Marjon's house", "Amsterdam", 2, "Red", 180),
  Home.new("Chris's house", "London", 3, "Blue", 200),
  Home.new("Ben's house", "Portland", 2, "White", 150),
  Home.new("John's house", "Orlando", 2, "Black", 320),
  Home.new("Katy's house", "Madrid", 4, "Purple", 290),
]

def printhomes(array)
  array.each do |house|
    puts "#{house.name} in #{house.city} has #{house.rooms} rooms and is #{house.colour}"
    puts "Price: #{house.price}"
  end
end
# for house in houses.each do
#   puts "#{house.name} in #{house.city} has #{house.rooms} rooms and is #{house.colour}"
#   puts "Price: #{house.price}"
# end

sorted_by_price = houses.sort_by do |house|
  house.price
end

# printhomes(sorted_by_price)
puts "Here are our available homes:"
printhomes(houses)

puts "How would you like this sorted?
\nType PRICE if you want them sorted by price
\nType ROOMS if you want to sort by the number of rooms
\nType COLOUR if you want to sort them by colour."

criteria = gets.chomp.upcase

case criteria
when "PRICE"
  sorted_by_price = houses.sort_by do |house|
    house.price
  end
  printhomes(sorted_by_price)
when "ROOMS"
  sorted_by_capacity = houses.sort_by do |house|
    house.rooms
  end
  printhomes(sorted_by_capacity)
when "COLOUR"
  sorted_by_colour = houses.sort_by do |house|
    house.colour
  end
  printhomes(sorted_by_colour)
else
  puts "That's is not a valid command. Please try PRICE, ROOMS or COLOUR."
end

puts "In what city are you looking for a house?"
input_city = gets.chomp

selected_by_city = houses.select do |house|
  house.city == input_city
end
printhomes(selected_by_city)

def sum(array)
  sum = array.reduce(0) do |sum, item|
    sum + item.price
  end
end

def average(array)
  prices_average = sum(array) / array.length
  puts "The average price of the houses is: #{prices_average}"
end

average(houses)

puts "What's your budget limit?"
limit = gets.chomp.to_i

selected_by_price = houses.select do |house|
  house.price < limit
end

printhomes(selected_by_price)
