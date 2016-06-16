class Vehicle
  attr_reader :wheels
  def initialize(wheels, noise)
    @wheels = wheels
    @noise = noise
  end
  def make_noise
    puts @noise
  end
end

class CarDealer
  def initialize(array)
    @array = array
  end
  def count_wheels
    total_wheels = @array.reduce(0) do |sum, vehicle|
      sum += vehicle.wheels
    end
  end
  def make_noises
    @array.each do |vehicle|
      vehicle.make_noise
    end
  end
  def printinventory
    @cars.each do |car|
      puts @cars_hash
    end
  end
end

car = Vehicle.new(4, "Brooooom!")
motorbike = Vehicle.new(2, "Brooooom Broom!")
bicycle = Vehicle.new(2, "Ring ring!")

vechicles_arr = [car, motorbike, bicycle]

cardealer = CarDealer.new(vechicles_arr)
puts cardealer.count_wheels
puts cardealer.make_noises
