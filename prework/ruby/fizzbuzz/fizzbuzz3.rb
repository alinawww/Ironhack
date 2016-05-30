1.upto(100) do |number|
number.string
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