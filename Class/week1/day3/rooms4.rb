require 'pry'
class Room
  attr_reader :id, :name, :description
  def initialize(id, name, description)
    # @type = type
    @id = id
    @name = name
    @doors = []
    @description = description
  end
  def add_door_to_room(door)
    @doors.push(door)
  end
  def welcome_in_room
    puts @description
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

class Door
  def initialize(location, direction)
    @location = location
  end
end
# access_points = ["N", "E", "S", "W"]

description1 = "Traaala"
description2 = "Traaala"
description3 = "Traaaadskjnsfiusfisd"
description4 = "Traaaadskjnsfiusfisd"
description5 = "Traaaadskjnsfiusfisd"
description6 = "Traaaadskjnsfiusfisd"
description7 = "Traaaadskjnsfiusfisd"


room1 = Room.new(2, "Two", description1)
room2 = Room.new(2, "Two", description2)
room3 = Room.new(3, "Three", description3)
room4 = Room.new(4, "Four", description4)
room5 = Room.new(5, "Five", description5)
room6 = Room.new(6, "Six", description6)
room7 = Room.new(7, "Seven", description7)



class Player
  attr_accessor :current_room
  def initialize(name, current_room)
    @name = name
    @current_room = current_room
    @inventory = []
  end
  def change_current_room(new_room)
    @current_room = new_room
  end
end

class Game
  attr_reader :player
  def initialize(name, player)
    @name = name
    @rooms = []
    @player = player
    @commands = ["N", "E", "S", "W"]
  end
  def add_rooms(room)
    @rooms.push(room)
  end
  # def add_players(player)
  #   @player.push(player)
  # end
  def welcome_user
    # puts "What will your name be?"
    # @name = gets.chomp
    puts "Welcome #{@name}. You're in a red room. There is a door at the north."
    puts ">"
  end
  def room_info(room)
    puts "#{room.name} & #{room.description}"
    puts "What's your next move?"
    
  end
end

door_north  = Door.new("N", 1)
door_south  = Door.new("S", 2)
door_east  = Door.new("E", 3)
door_west  = Door.new("W", 4)

room1.add_door_to_room(door_north)
room2.add_door_to_room(door_north)
room3.add_door_to_room(door_north)
room3.add_door_to_room(door_west)
room3.add_door_to_room(door_south)






alina = Player.new("Alina", room1)
# new_game.add_players(alina)
new_game = Game.new("game1", alina)

new_game.welcome_user
new_game.room_info(new_game.player.current_room)
alina.change_current_room(room2)
new_game.add_rooms(room1)
new_game.add_rooms(room2)
new_game.add_rooms(room3)
new_game.add_rooms(room4)
new_game.add_rooms(room5)
new_game.add_rooms(room6)
new_game.add_rooms(room7)
