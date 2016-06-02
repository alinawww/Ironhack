class Item
    attr_reader :price_of_item, :name_of_item
    def initialize(name_of_item, base_price)
        @name_of_item = name_of_item
        @base_price = base_price
    end
    def price_of_item
        total_price_of_item = @base_price
        return total_price_of_item
    end
end


class Fruit < Item
    def price_of_item
        total_price_of_item = @base_price
        t = Time.now
        if t.saturday? || t.sunday?
            total_price_of_item = @base_price - 0.1 * @base_price
        else
            total_price_of_item = @base_price
        end
        return total_price_of_item
    end
end

class Houseware < Item
    def price_of_item
        if @base_price > 100
            total_price_of_item = @base_price - 0.05 * @base_price
        else
            total_price_of_item = @base_price
        end
        return total_price_of_item
        
    end
end

class ShoppingCart
    def initialize
        @items = []
    end
    def shopping_time(day_of_purchase)
        @day_of_purchase = day_of_purchase
    end
    def add_to_cart(item)
        @items.push(item)
    end
    def list_products
        @items.each do |item|
            total += item.price_of_item
            puts item => item.price_of_item
        end
        return total
    end
    def checkout
        total = 0
        @items.each do |item|
            if @items.length > 5
                total += item.price_of_item - 0.10 * item.price_of_item
            else
                total += item.price_of_item
            end
            puts "#{item.name_of_item} => $#{item.price_of_item}"
        end
        puts "-------------------------------------------"
        return total
    end
end

banana = Fruit.new("Bananas", 2)
orange_juice = Fruit.new("Orange Juice", 10)
banana = Fruit.new("Banana", 10)
vacuum_cleaner = Houseware.new("Vacuum Cleaner", 150)
oj = Item.new("Orange Juice", 10)
rice = Item.new("Rice", 1)
anchovies = Item.new("Anchovies", 2)
table = Houseware.new("Table", 50)


alina = ShoppingCart.new
alina.add_to_cart(vacuum_cleaner)
alina.add_to_cart(table)
alina.add_to_cart(rice)
alina.add_to_cart(banana)
alina.add_to_cart(banana)
alina.shopping_time(1)

time = Time.new
t = Time.now
if t.saturday? || t.sunday?
    puts "-------------------------------------------"
    puts "It's weekend! You get a discount for Fruit."
else
    puts "-------------------------------------------"
    puts "This is your order"
end
puts "-------------------------------------------"
puts "Your total is: $#{alina.checkout}. Have a nice day!"
puts "-------------------------------------------"