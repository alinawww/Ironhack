puts "Write here some text:"
text = gets.chomp
words = text.split

def alphabetize (arr)
    arr.sort {|item1, item2| item1.upcase <=> item2.upcase}
end

words.each do |word|
    word = word.gsub(/\p{P}/, "")
end

puts "#{alphabetize(words)}"