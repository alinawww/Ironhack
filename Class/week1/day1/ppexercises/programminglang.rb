class ProgrammingLanguage
  attr_accessor :name, :age, :type
  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end

ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")


array_of_languages = [ruby, python, javascript, go, rust, swift, java]

def array_printer(array)
  array.each do |item|
    puts "Language: #{item.name} |  Age: #{item.age} |  Type System: #{item.type}"
  end
end

#array_printer(array_of_languages)

#AGED LANGUAGES
###
# aged_languages = array_of_languages.map do |item|
#   puts "Language: #{item.name} |  Age: #{item.age + 1} |  Type System: #{item.type}"
# end
#
# array_printer(aged_languages)

#SORTED LANGUAGES
##
# sorted_languages = array_of_languages.sort_by do |item|
#   -item.age
#   #puts "Language: #{item.name} |  Age: #{item.age} |  Type System: #{item.type}"
# end
# array_printer(sorted_languages)

#DELETE JAVA
# sorted_languages = array_of_languages.delete_if do |item|
#   item.name == "Java"
#  #puts "Language: #{item.name} |  Age: #{item.age} |  Type System: #{item.type}"
# end
# array_printer(sorted_languages)

#SHUFFLE
# shuffled_languages = array_of_languages.shuffle!
# array_printer(shuffled_languages)

#SELECT
# selected_languages = array_of_languages.select do |item|
#   item.age < 20
#  #puts "Language: #{item.name} |  Age: #{item.age} |  Type System: #{item.type}"
# end
# array_printer(selected_languages.shuffle!)

#JOIN
array = []
array_of_languages.each do |item|
   string = item.name + item.age.to_s + item.type
   array.push (string)
  #  item.each do |element|
  #    array.push(element)
  #    puts array
end

finalstring = array.join
puts finalstring

#SLICE
splitted = finalstring.split("2")
puts splitted
