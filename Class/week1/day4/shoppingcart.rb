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
  def quantify
    @item_group = {}
  end
  def add_item_to_group(item)
    @item_group[item.name.to_sym] = item.price
    if
  end
  def add_quantified_to_inventory(item_group)
    @inventory[@item_group] = item_group.price
  end
  # def count_items
  #   counter = 0
  #   @inventory.each do |item|
  #     item.name = quantity.to + item.name
  #   end
  # end
  def show
    @inventory.each do |key, value|
      puts "#{key}: #{value}"
    end
  end

  def cost
    total=0
    @inventory.each do |key, value|
        total += value
    end
    puts "Total: #{total}"
  end
end

# :apples     10$
# :oranges     5$
# :grapes     15$
# :banana     20$
# :watermelon 50$

# my_products = {
#   :apple => 10,
#   :banana => 20,
#   :orange => 4,
# }
#
apple = Item.new("apple", 10)
banana = Item.new("banana", 20)
grapes = Item.new("grapes", 15)


# product1[:apple] = 10
# product2[:banana] = 20
# product1 = Item.new("apple", 10)
# product2 = Item.new("banana", 20)

cart = ShoppingCart.new


cart.add_item_to_cart (apple)
cart.add_item_to_cart (banana)
cart.add_item_to_cart (banana)
cart.add_item_to_cart (grapes)


# cart.add_item_to_cart :apple
# cart.add_item_to_cart :banana
# cart.add_item_to_cart :banana

cart.show
# 1 apple: 10$
# 2 bananas: 40$
cart.cost
# cart.cost = 50
