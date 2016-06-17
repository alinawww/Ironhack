require 'ruby-dictionary'
require 'pry'

class WordChain
  def initialize(dictionary)
      @dictionary = dictionary
  end

  def find_chain(word1, word2)
    @word1 = word1
    @word2 = word2
    unless @word1 == @word2
      @word1 = @word1.split("")
      i = 0
      @word1.each do |letter|
        if i <= @word1.length && @dictionary.exists?(@word1.join)
          @word1[i] = @word2[i]
        end
        i += 1
        puts @word1.join
      end
    end
  end
end


 # && @dictionary.exists? @word1.join
    # def find_chain(word1, word2)
    #   @word1 = word1
    #   @word2 = word2
    #   unless @word1 == @word2 then
    #     @word1 = @word1.split("")
    #     i = 0
    #     @word1.each do |letter|
    #       if i <= @word1.length
    #         @word1[i] = @word2[i]
    #         i += 1
    #       end
    #       if @dictionary.exists? @word1.join
    #         puts @word1.join
    #       end
    #     end
    #   end
    # end
# end

dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("flower", "tulip")

# cat
# cot
# cog
# dog
