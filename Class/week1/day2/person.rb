class Person
  attr_reader :name
  attr_accessor :age
  def initialize(name, age)
    @name = name
    @age = age
  end
end

alina = Person.new("Alina", 26)

puts alina.name
puts alina.age
alina.age = 39

puts alina.age
