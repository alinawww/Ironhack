
puts "Write here some text:"
text = gets.chomp
words = text.scan(/[\w']+/)

def alphabetize(arr)
    arr.sort {|item1, item2| item1.upcase <=> item2.upcase}
end


puts "#{alphabetize(words)}"