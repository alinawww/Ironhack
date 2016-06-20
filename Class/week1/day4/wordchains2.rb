require 'ruby-dictionary'
require 'pry'


class WordChain
  def initialize(dictionary)
      @dictionary = dictionary
  end
  def find_chain(word1, word2)
    @word1 = @word1.split("")
    @word2 = word2
    tempword = @word1.dup
    while @word1 != @word2
    i = 0
      @word1.each do |letter|
        tempword[i] = @word2[i]
        puts @word1.join
          if @dictionary.exists?(tempword.join)
            @word1 = tempword.dup
            # i=0
          else
            # tempword[i] = letter
          end
        i += 1
      end
    end
  end
end

dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("lead", "gold")

# cat
# cot
# cog
# dog
