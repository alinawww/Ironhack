i = 0
v = 20
addition = 3

numbers = []

while i<v
    puts "At the top i is #{i}"
    numbers.push(i)

    i += addition
    puts "Numbers now: ", numbers
    puts "At the bottom i is #{i}"
end

puts "The numbers: "