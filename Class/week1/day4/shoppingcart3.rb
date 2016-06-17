require 'pry'

class Item
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class ShoppingCart
  def initialize
    @inventory = {}
  end
  def add_item_to_cart(item)
    # @inventory.each do |item|
      #binding.pry
      if @inventory.key?(item.name.to_sym)
        @inventory[item.name.to_sym][:quantity] += 1
        @inventory[item.name.to_sym][:price] += @inventory[item.name.to_sym][:price]

      else
        @inventory[item.name.to_sym] = {:quantity => 1, :price => item.price}
        # @inventory[item.name.to_sym][:quantity] = 1
        # @inventory[item.name.to_sym][:price] = item.price
      end
    # end
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

banana = Item.new("banana", 20)
oranges = Item.new("oranges", 5)
watermelon = Item.new("watermelon", 50)
grapes = Item.new("grapes", 15)


# product1[:apple] = 10
# product2[:banana] = 20
# product1 = Item.new("apple", 10)
# product2 = Item.new("banana", 20)

cart = ShoppingCart.new


cart.add_item_to_cart (apple)
cart.add_item_to_cart (banana)
cart.add_item_to_cart (banana)
cart.add_item_to_cart (oranges)
cart.add_item_to_cart (watermelon)
cart.add_item_to_cart (grapes)


# cart.add_item_to_cart :apple
# cart.add_item_to_cart :banana
# cart.add_item_to_cart :banana

cart.show
# 1 apple: 10$
# 2 bananas: 40$
cart.cost
# cart.cost = 50
