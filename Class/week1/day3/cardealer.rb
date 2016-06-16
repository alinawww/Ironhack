
class CarDealer
  def initialize(inventory)
    @inventory= inventory
  end
  def cars(brand)
    @inventory[brand.to_sym].each do |model|
      puts model
    end
  end
  def printinventory
    @cars.each do |car|
      puts @cars_hash
    end
  end
end


inventory = {
  :Ford => ["Fiesta", "Mustang"],
  :Seat => ["Ibiza", "Leon"]
}

car_dealer = CarDealer.new(inventory)
car_dealer.cars("Ford")
car_dealer.cars("Seat")
