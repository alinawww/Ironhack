require 'pry'
class Room
  def initialize(name, access, description)
    # @type = type
    @name = name
    @access = access
    @description = description
  end
  def welcome_in_room
    puts @description
  end
end

access_points = ["N", "E", "S", "W"]

description2 = "Traaala"
description3 = "Traaaadskjnsfiusfisd"
description4 = "Traaaadskjnsfiusfisd"
description5 = "Traaaadskjnsfiusfisd"
description6 = "Traaaadskjnsfiusfisd"
description7 = "Traaaadskjnsfiusfisd"

room1 = "This is the first room"
room2 = Room.new("Two", access_points, description2)
room3 = Room.new("Three", access_points, description3)
room4 = Room.new("Four", access_points, description4)
room5 = Room.new("Five", access_points, description5)
room6 = Room.new("Six", access_points, description6)
room7 = Room.new("Seven", access_points, description7)

rooms = [room1, room2, room3, room4, room5, room6, room7]

class Game
  def initialize(name, environment)
    @name = name
    @environment = environment
    @current_room = @environment[0]
    @location = {@name.to_sym => @current_room}
    @access_points = ["N", "E", "S", "W"]
  end
  def welcome_user
    puts "What will your name be?"
    @name = gets.chomp
    puts "Welcome #{@name}. You're in a red room. There is a door at the north."
    puts ">"
  end
  def exit_room
    direction = gets.chomp
    if direction == @access_points[0]
      #binding.pry
      @current_room = @environment[2]
      exit_room
      @current_room.enter_room(@current_room)
    else
      puts "Can't go that way"
    end
  end
  def enter_room(room)
    room = current_room
    room.welcome_in_room
  end
end

new_game = Game.new("alina", rooms)
new_game.welcome_user
new_game.exit_room

# class Game
#   include Player
#   def start_game
#     puts "Do you want to start the game?"
#     puts "YES | NO"
#     choice = gets.chomp
#     if choice == "YES"
#       puts "Welcome to best game in the world!"
#       puts "What do you want your name to be?"
#       @user = gets.chomp
#       puts "Hola #{@user}! Here are some rules for the game.\n
#       GOAL: Find the best room. You'll know it when you get there.\n
#       HOW TO: You can move through the rooms by using the commands 'N', 'E', 'S', 'W'.\n
#       You will need to add your command after you see the sign '>'.\n
#       ------------------\n
#       If everything is clear type 'K'."
#       ready = gets.chomp
#       if ready == 'K'
#         puts "Welcome again. You're in a red room. There is a door at the north."
#         puts ">"
#
#       else
#         puts "Read the instructions again."
#       end
#     elsif choice == "NO"
#       puts "Alrighty :) Maybe later."
#     else
#       puts "Sorry, I don't understand the command."
#     end
#   end
# end

# game1 = Game.new("asd")
# game1.start_game
#
# class Room2 < Room
#   def welcome_user
#     puts "Welcome again. You're in a blue room. There is a door at the north."
#     puts ">"
#   end
#   def exit
#     direction = gets.chomp
#     if direction == @access_points[0]
#       @current_room = @environment[3]
#       @current_room.welcome_user.exit
#     else
#       puts "Can't go that way"
#     end
#   end
# end
#
# class Room3 < Room
#   def welcome_user
#     puts "Welcome again. You're in a yellow room. There are three exits. One to the north, one to the south and one to the west."
#     puts ">"
#   end
#   def exit
#     direction = gets.chomp
#     if direction == @access_points[0]
#       @current_room = @environment[2]
#       @current_room.welcome_user.exit
#     elsif direction == @access_points[2]
#       @current_room = @environment[0]
#       @current_room.welcome_user.exit
#     elsif direction == @access_points[3]
#       @current_room = @environment[3]
#       @current_room.welcome_user.exit
#     else
#       puts "Can't go that way"
#     end
#   end
# end
#
# class Room4 < Room
#   def welcome_user
#     puts "Welcome again. You're in a purple room. You can go anywhere!"
#     puts ">"
#   end
#   def exit
#     direction = gets.chomp
#     if direction == @access_points[0]
#       @current_room = @environment[5]
#       @current_room.welcome_user.exit
#     elsif direction == @access_points[1]
#       @current_room = @environment[2]
#       @current_room.welcome_user.exit
#     elsif direction == @access_points[2]
#       @current_room = @environment[1]
#       @current_room.welcome_user.exit
#     elsif direction == @access_points[3]
#       @current_room = @environment[6]
#       @current_room.welcome_user.exit
#     else
#       puts "Can't go that way"
#     end
#   end
# end
#
# class Room5 < Room
#   def welcome_user
#     puts "Welcome again. You're in a white room. No exists here. You can only go back."
#     puts ">"
#   end
#   def exit
#     direction = gets.chomp
#     if direction == @access_points[2]
#       @current_room = @environment[2]
#       @current_room.welcome_user.exit
#     else
#       puts "Can't go that way"
#     end
#   end
# end
# class Room6 < Room
#   def welcome_user
#     puts "OMG OMG OMG OMG! This is the most awesome room. You're here!!!!"
#     puts "*************"
#     puts "**********"
#     puts "*******"
#     puts "****"
#   end
# end
# class Room7 < Room
#   def welcome_user
#     puts "Can't go anywere from here. That was a one way. You're stuck. YOU DEAD!"
#     puts "_/\_/\_____________"
#   end
# end
