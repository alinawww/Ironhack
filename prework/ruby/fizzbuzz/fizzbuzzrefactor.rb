number = 0
while number < 100
    number += 1
    result = ""
    result << "FizzBuzz" if number % 3 == 0 && number % 5 == 0
    result << "Fizz" if number % 3 == 0
    result << "Buzz" if number % 5 == 0
    puts result
end

argggghhhhh!!