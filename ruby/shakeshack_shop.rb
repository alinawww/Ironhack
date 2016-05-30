class MilkShake
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
    def add_milkshake(bought_milkshake)
        @bought_milkshake = Hash.new
        @bought_milkshake["milkshake"] = total_price_of_milkshake
        @milkshakes_list.push(bought_milkshake)
    end
    def checkout
        checkout_price = total_price_of_milkshake
        @milkshakes_list.each do |milkshake, price|
            checkout_price += price.price
        end
        return checkout_price
    end
end



#all ingredients that are available
banana = Ingredient.new("Banana", 2)
chocolate_chips = Ingredient.new("Chocolate Chips", 1)

#all bought milkshakes
nizars_milkshake = MilkShake.new
nizars_milkshake.add_ingredient(banana)
nizars_milkshake.add_ingredient(chocolate_chips)

alinas_milkshake = MilkShake.new
alinas_milkshake.add_ingredient(banana)

marjonas_milkshake = MilkShake.new
marjonas_milkshake.add_ingredient(chocolate_chips)

puts @milkshakes_list
