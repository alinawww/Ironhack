require 'pry'
class Login
  def initialize(user = "User", user_name, password)
    @users = {
      @user => [:user_name => "mama", :password => "banana!"],
      @user => [:user_name => "tata", :password => "strawberry"],
      @user => [:user_name => "alina", :password => "apple"],
      @user => [:user_name => "ben", :password => "watermelon"]
    }
    @user = user
    @user_name = user_name
    @password = password
  end
  def validate_login
      binding.pry
    @users.each do |user|
      return true if @users[user] = @users[user][:user_name] && @password == @users[user][:password]

    end
  end
end

class AI
  def self.powerful_algorithm
      puts "Ask me anything you want. ANYTHING!"
      input_string = gets.chomp
      puts "Ok, the answer is:"
      puts input_string.size
  end
end


puts "Username:"
user_name = gets.chomp
puts "Password:"
password = gets.chomp

Login.new(user, user_name, password).validate_login == true ? AI.powerful_algorithm : puts("Incorrect")
