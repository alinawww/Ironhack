class Login
  def initialize(users)
    @users = users
  end
  def validate_login
    @users.each do |user|
      return true if @users[user] == @password
    end
  end
end


class AI #asks for command
  def self.powerful_algorithm
      puts "Ask me anything you want. ANYTHING!"
      input_string = gets.chomp
      puts "Ok, the answer is:"
      puts input_string.size
  end
  def self.get_command(input_string)
    puts "You can now do the following things by using the indicated command key:"
    puts "[ CW ] ---> Count the words in your text."
    puts "[ CL ] ---> Count the letters in your text."
    puts "[ RT ] ---> Reverse the text."
    puts "[ TU ] ---> Convert your text to uppercase."
    puts "[ TL ] ---> Convert your text to lowercase."
    command = gets.chomp
    case command
      when "CW"
        CountWords.new(input_string)
      when "CL"
        CountLetters.new(input_string)
      when "RT"
        ReverseText.new(input_string)
      when "TU"
        TextUppercase.new(input_string)
      when "TL"
        TextLowercase.new(input_string)
      else
        puts "I don't understand the command."
    end
  end
end



class CountWords
  def initialize(input)
    @input = input
  end
  def count
    array = @input.split (" ")
    puts array.length
  end
end
class CountLetters
  def initialize(input)
    @input = input
  end
  def count
    puts @input.length
  end
end
class ReverseText
  def initialize(input)
    @input = input
  end
  def reverse
    array = @input.chars.sort_by.with_index do |_, i|
      -i
    end
    puts array.join
  end
end
class TextUppercase
  def initialize(input)
    @input = input
  end
  def make_uppercase
    puts @input.upcase
  end
end
class TextLowercase
  def initialize(input)
    @input = input
  end
  def make_lowercase
    puts @input.lowercase
  end
end

users = {
  :Alina => "7eef7295c50d70615433858746056bca",
  :Marjon => "1441f19754335ca4638bfdf1aea00c6d"
}

puts "Username:"
user_name = gets.chomp
puts "Password:"
password = gets.chomp


Login.new(users).validate_login == true ? AI.powerful_algorithm : puts("Incorrect")
AI.get_command(AI.powerful_algorithm)
