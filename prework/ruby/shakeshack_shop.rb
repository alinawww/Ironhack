class MilkShake
    attr_reader :item_price, :item_name
    def initialize
        @base_price = 3
        @ingredients = [ ]
    end
    def add_ingredient(ingredient)
        @ingredients.push(ingredient)
    end
    def price_of_milkshake
        total_price_of_milkshake = @base_price
        @ingredients.each do |ingredient|
            total_price_of_milkshake += ingredient.price
        end
        return total_price_of_milkshake
    end
    def item
        @item_name = "Milkshake with #{ingredient}"
        @item_price = price_of_milkshake
    end
end


class Ingredient
    attr_reader :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
end


class Shop
    def initialize
        @milkshakes_list = [ ]
    end
    def add_milkshake(item)
        @milkshakes_list.push(item)
    end
    def checkout
        checkout_price =
        @milkshakes_list.each do |item|
            checkout_price += item
        end
        return checkout_price
    end
end



#all ingredients that are available
banana = Ingredient.new("Banana", 2)
chocolate_chips = Ingredient.new("Chocolate Chips", 1)
berries = Ingredient.new("Berries", 1)

#all bought milkshakes
nizars_milkshake = MilkShake.new
nizars_milkshake.add_ingredient(banana)
nizars_milkshake.add_ingredient(chocolate_chips)

alinas_milkshake = MilkShake.new
alinas_milkshake.add_ingredient(banana)

marjonas_milkshake = MilkShake.new
marjonas_milkshake.add_ingredient(chocolate_chips)

shoppings = Shop.new
shoppings.add_milkshake(nizars_milkshake.price_of_milkshake)
shoppings.add_milkshake(alinas_milkshake.price_of_milkshake)
shoppings.add_milkshake(marjonas_milkshake.price_of_milkshake)
puts shoppings.checkout
