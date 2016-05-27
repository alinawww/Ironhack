number = 0
while number < 100
    number = number + 1
    if number % 5 == 0 and number % 3 == 0
        puts "FizzBuzz"
        elsif number % 5 == 0
        puts "Buzz"
        elsif number % 3 == 0
        puts "Fizz"
        else
        puts number
    end
end

