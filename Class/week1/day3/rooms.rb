#require 'pry'

class Player
  attr_reader :location
  def initialize(name, current_room)
    @name = name
    @current_room = current_room
    @location[@name.to_sym] = @current_room
  end
  def change_room

  end
end

class Room
  def initialize
    # @type = type
    @access_points = ["N", "E", "S", "W"]
  end
end

class Room1 < Room
  def welcome_user
    puts "Welcome again. You're in a red room. There is a door at the north."
    puts ">"
  end
  def exit
    direction = gets.chomp
    if direction == @access_points[0]
      #binding.pry
      Room3.new
    else
      puts "Can't go that way"
    end
  end
end

class Room2 < Room
  def welcome_user
    puts "Welcome again. You're in a blue room. There is a door at the north."
    puts ">"
  end
  def exit
    direction = gets.chomp
    if direction == @access_points[0]
      Room4.new
    else
      puts "Can't go that way"
    end
  end
end

class Room3 < Room
  def welcome_user
    puts "Welcome again. You're in a yellow room. There are three exits. One to the north, one to the south and one to the west."
    puts ">"
  end
  def exit
    direction = gets.chomp
    if direction == @access_points[0]
      Room3.new
    elsif direction == @access_points[2]
      Room1.new
    elsif direction == @access_points[3]
      Room4.new
    else
      puts "Can't go that way"
    end
  end
end

class Room4 < Room
  def welcome_user
    puts "Welcome again. You're in a purple room. You can go anywhere!"
    puts ">"
  end
  def exit
    direction = gets.chomp
    if direction == @access_points[0]
      Room6.new
    elsif direction == @access_points[1]
      Room3.new
    elsif direction == @access_points[2]
      Room2.new
    elsif direction == @access_points[3]
      Room7.new
    else
      puts "Can't go that way"
    end
  end
end

class Room5 < Room
  def welcome_user
    puts "Welcome again. You're in a white room. No exists here. You can only go back."
    puts ">"
  end
  def exit
    direction = gets.chomp
    if direction == @access_points[2]
      Room3.new
    else
      puts "Can't go that way"
    end
  end
end
class Room6 < Room
  def welcome_user
    puts "OMG OMG OMG OMG! This is the most awesome room. You're here!!!!"
    puts "*************"
    puts "**********"
    puts "*******"
    puts "****"
  end
end
class Room7 < Room
  def welcome_user
    puts "Can't go anywere from here. That was a one way. You're stuck. YOU DEAD!"
    puts "_/\_/\_____________"
  end
end

class Game
  include Player
  def start_game
    puts "Do you want to start the game?"
    puts "YES | NO"
    choice = gets.chomp
    if choice == "YES"
      puts "Welcome to best game in the world!"
      puts "What do you want your name to be?"
      @user = gets.chomp
      puts "Hola #{@user}! Here are some rules for the game.\n
      GOAL: Find the best room. You'll know it when you get there.\n
      HOW TO: You can move through the rooms by using the commands 'N', 'E', 'S', 'W'.\n
      You will need to add your command after you see the sign '>'.\n
      ------------------\n
      If everything is clear type 'K'."
      ready = gets.chomp
      if ready == 'K'
        puts "Welcome again. You're in a red room. There is a door at the north."
        puts ">"

      else
        puts "Read the instructions again."
      end
    elsif choice == "NO"
      puts "Alrighty :) Maybe later."
    else
      puts "Sorry, I don't understand the command."
    end
  end
end

# game1 = Game.new("asd")
# game1.start_game

room1 = Room1.new


room1.welcome_user
room1.exit
