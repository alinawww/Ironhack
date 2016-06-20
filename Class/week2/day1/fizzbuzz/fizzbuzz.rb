class FizzBuzz
  def initialize(array)
    @array = array
    array.each do |n|
      calculate(n)
    end
  end

  def calculate(number)
    #calculate output for number
    if number % 15 == 0
      puts "FizzBuzz"
    elsif number % 3 == 0
      puts "Fizz"
    elsif number % 5 == 0
      puts "Buzz"
    else
      puts number
    end
  end
end
# 
# array = 0...20
# myfizz = FizzBuzz.new(array)
