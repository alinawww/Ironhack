require 'yaml/store'
require 'pry'

class Login
  attr_accessor :users_store, :users
  def initialize
    @users_store = YAML::Store.new('users.yml')
    @users = YAML.load_file('users.yml')
  end
  def login(user, password)
    # binding.pry
    if @users.has_key?(user)
      if @users[user] == password
        # puts "you're logged in"
        return true
      else
        # puts "sorry, we don't know that"
        return false
      end
    else
    signup
    end
  end

  def signup
    puts "The submitted user doesn't exist. We're signing you up."
    puts "What username do you want?"
    @new_user = gets.chomp
    puts "What password do you want?"
    @new_password = gets.chomp
    @users[@new_user.to_sym] = @new_password
    @users_store.transaction do
      @users_store[@new_user] = @new_password
    end
  end
end
