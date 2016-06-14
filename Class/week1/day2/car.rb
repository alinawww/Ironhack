class Car
  attr_accessor :name
  def initialize(name, year, color, noise)
    @name = name
    @year = year
    @color = color
    @cities = []
  end
  def make_sound
    puts @noise
  end
  def self.model
    puts "Maserati"
  end
  def printcar
    puts "#{@name} is from the year #{@year}, has a #{@color} color and makes the noise #{@noise}"
  end
  def cities
    puts "what's your current city?"
    current_city = gets.chomp
    @cities.push(current_city)
  end
  def visitedcities(save = false)
    if save
      IO.write("#{self.object_id}.txt", @cities)
    else
      puts "The cities #{car1.name} visited are:"
      @cities.each do |city|
        puts "--> #{city}"
      end
    end
  end
  def self.speed_control
    puts "What's your current speed?"
    speed = gets.chomp.to_i
    if speed > 100
      puts "UH! You're moving too fast, and I don't think it's right ;)"
    else
      puts "All good my friend. Safe trip!"
    end
  end
end

class RacingCar < Car
  def make_sound
    puts "BAAAAAAAAAM!!!"
  end
end

sound1 = "Broom!"
sound2 = "BROOOOOOOOOOOOOM!!!"

 car1 = Car.new("Mercedes", 2015, "red", sound1)
 car2 = Car.new("Seat", 2010, "blue", sound2)
#
#
#  car1.cities
#  car1.cities
#  car1.cities
#  car1.cities
#
#  car2.cities
#  car2.cities
#  car2.cities
#  car2.cities
#
#
#
# car1.visitedcities(true)
# car1.visitedcities

racing_car = RacingCar.new("Mercedes", 2015, "red", "sound")
racing_car.make_sound
