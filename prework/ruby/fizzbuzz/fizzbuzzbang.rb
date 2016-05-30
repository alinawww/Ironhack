number = 0
while number < 100
    number = number + 1
    if number.to_s.length < 2
        if number.to_f / 10 < 0.2
        puts "Bang"
        elsif number % 5 == 0 and number % 3 == 0
        puts "FizzBuzz"
        elsif number % 5 == 0
        puts "Buzz"
        elsif number % 3 == 0
        puts "Fizz"
        else
        puts number
        end
    elsif number.to_s.length < 3
        if number.to_f / 10 < 2
            puts "Bang"
            elsif number % 5 == 0 and number % 3 == 0
            puts "FizzBuzz"
            elsif number % 5 == 0
            puts "Buzz"
            elsif number % 3 == 0
            puts "Fizz"
            else
            puts number
        end
    elsif number.to_s.length < 4
        if number.to_f / 10 < 20
            puts "Bang"
            elsif number % 5 == 0 and number % 3 == 0
            puts "FizzBuzz"
            elsif number % 5 == 0
            puts "Buzz"
            elsif number % 3 == 0
            puts "Fizz"
            else
            puts number
        end
    end
end

