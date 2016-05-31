class MilkShake
    attr_reader :price_of_milkshake, :ingredients
    def initialize
        @base_price = 3
        @ingredients = [ ]
    end
    def add_ingredient(ingredient)
        @ingredients.push(ingredient)
    end
    def name_of_milkshake
        milkshake_name = "Milkshake"
        ingredients = @ingredients.map{|ingredient| ingredient.name}
            milkshake_name = "Milkshake with #{ingredients.join(", ")}"
        return milkshake_name
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
    def add_milkshake(item)
        @milkshakes_list.push(item)
    end
    def list_products
        @milkshakes_list.each do |item|
            total += item.price_of_milkshake
            puts item => item.price_of_milkshake
        end
        return total
    end
    def checkout
        total = 0
        @milkshakes_list.each do |item|
           total += item.price_of_milkshake
           puts "#{item.name_of_milkshake} => #{item.price_of_milkshake}"
        end
        puts "-------------------------------------------"
        return total
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

marias_milkshake = MilkShake.new
marias_milkshake.add_ingredient(berries)

shoppings = Shop.new
shoppings.add_milkshake(nizars_milkshake)
shoppings.add_milkshake(alinas_milkshake)
shoppings.add_milkshake(marjonas_milkshake)
shoppings.add_milkshake(marias_milkshake)
puts "-------------------------------------------"
puts "This is your order"
puts "-------------------------------------------"
puts "Total: #{shoppings.checkout}"
puts "-------------------------------------------"