require 'pry'

class Item
  attr_accessor :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class ShoppingCart
   attr_accessor :inventory
  def initialize
    @inventory = {}
  end
  def add_item_to_cart(item)
    #  binding.pry
    if @inventory.key?(item.name.to_sym)
      @inventory[item.name.to_sym][:price] += @inventory[item.name.to_sym][:price]/@inventory[item.name.to_sym][:quantity]
      @inventory[item.name.to_sym][:quantity] += 1

    else
      @inventory[item.name.to_sym] = {:quantity => 1, :price => item.price}
    end
  end
  def two_for_one(item)
    #  binding.pry
    if @inventory.key?(item.name.to_sym)
      if @inventory[item.name.to_sym][:quantity] % 2 == 0
        @inventory[item.name.to_sym][:price] = @inventory[item.name.to_sym][:price] / 2
        # puts "#{@inventory[item.name.to_sym][:price]}*"
      else
        unit_price = @inventory[item.name.to_sym][:price] / @inventory[item.name.to_sym][:quantity]
        @inventory[item.name.to_sym][:price] = (@inventory[item.name.to_sym][:price] + unit_price) / 2
        return @inventory[item.name.to_sym][:price]
      end
    end
  end
  def three_for_two(item)
    #  binding.pry
    if @inventory.key?(item.name.to_sym)
      if @inventory[item.name.to_sym][:quantity] % 3 == 0
        @inventory[item.name.to_sym][:price] = (@inventory[item.name.to_sym][:price] / 3) * 2
      else
        remainder =  @inventory[item.name.to_sym][:quantity] % 3
        unit_price = @inventory[item.name.to_sym][:price] / @inventory[item.name.to_sym][:quantity]
        @inventory[item.name.to_sym][:price] = @inventory[item.name.to_sym][:price]/2 + unit_price * remainder
        return @inventory[item.name.to_sym][:price]
      end
    end
  end
  def get_free_banana(item, freebie)
    #  binding.pry
    if @inventory.key?(item.name.to_sym)
        if @inventory[item.name.to_sym][:quantity] > 4
        groups_of_four =  (@inventory[item.name.to_sym][:quantity] / 4).floor
          puts "**BONUS**\nFor every 4 #{item.name} you get a free banana. Do you want that?"
          want_banana = gets.chomp.downcase
          if want_banana == "yes"
            @inventory[freebie.name.to_sym][:quantity] = @inventory[freebie.name.to_sym][:quantity] * groups_of_four
            return @inventory[freebie.name.to_sym][:quantity]
          else
            puts "Ok, here's your receipt."
          end
      end
    end
  end
  def show
    @inventory.each do |key, value|
      puts "#{value[:quantity]} #{key} #{value[:price]}"
    end
    #binding.pry
  end
  def cost
    total=0
    @inventory.each do |key, value|
        total += value[:price]
    end
    puts "Total: #{total}"
  end
end

# :apples     10$
# :oranges     5$
# :grapes     15$
# :banana     20$
# :watermelon 50$

apple = Item.new("apple", 10)
oranges = Item.new("oranges", 5)
grapes = Item.new("grapes", 15)
banana = Item.new("banana", 20)
watermelon = Item.new("watermelon", 50)


cart = ShoppingCart.new

cart.add_item_to_cart (apple)
cart.add_item_to_cart (apple)
cart.add_item_to_cart (apple)
cart.add_item_to_cart (apple)
cart.add_item_to_cart (apple)
cart.add_item_to_cart (apple)
cart.add_item_to_cart (apple)
cart.add_item_to_cart (apple)
cart.add_item_to_cart (banana)
cart.add_item_to_cart (banana)
cart.add_item_to_cart (oranges)
cart.add_item_to_cart (watermelon)
cart.add_item_to_cart (grapes)
cart.add_item_to_cart (grapes)
cart.add_item_to_cart (grapes)
cart.add_item_to_cart (grapes)
cart.add_item_to_cart (grapes)
cart.add_item_to_cart (grapes)
cart.add_item_to_cart (grapes)
cart.add_item_to_cart (grapes)



cart.two_for_one(banana)
cart.three_for_two(apple)
cart.get_free_banana(grapes, banana)
cart.show
cart.cost
# #
# banana_deal = Deals.new(cart)
#
# banana_deal.two_for_one(banana)
