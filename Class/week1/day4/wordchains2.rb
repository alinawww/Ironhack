require 'ruby-dictionary'
require 'pry'
#
# class WordChain
#   def initialize(dictionary)
#       @dictionary = dictionary
#   end
#
#   def find_chain(word1, word2)
#     @word1 = word1
#     @word2 = word2
#     unless @word1 == @word2
#       @word1 = @word1.split("")
#       i = 0
#       @word1.each do |letter|
#         if i <= @word1.length && @dictionary.exists?(@word1.join)
#           @word1[i] = @word2[i]
#         end
#         i += 1
#         puts @word1.join
#       end
#     end
#   end
# end


class WordChain
  def initialize(dictionary)
      @dictionary = dictionary
  end
  def find_chain(word1, word2)
    @word1 = @word1.split("")
    @word2 = word2
    # @word1 = @word1.split("")
    tempword = @word1
    unless @word1 == @word2 then
    i = 0
      @word1.each do |letter|
        # binding.pry

        if i <= @word1.length
          tempword[i] = @word2[i]
          puts @word1.join
            if @dictionary.exists?(tempword.join)
              @word1 = tempword
              # i=0
            else
              # tempword[i] = letter
            end
          i += 1
        end
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
