class Lexiconomitron
  def eat_t(word)
    # string = string.split('')
    # string.each do |letter|
    #   if letter.downcase == "t"
    #       letter.gsub!(/[letter]/, "")
    #     print letter
    #   else
    #     print letter
    #   end
    # end
    word.split('').select {|char| char.downcase != 't'}.join
  end
  def shazam(words)
    words.map!(&:reverse)
    [eat_t(words.first), eat_t(words.last)]
  end
  def oompa_loompa(words)
    words.select {|word| word.size <= 3}.map {|word| eat_t(word)}
  end
end
# 
# mytest = Lexiconomitron.new
# mytest.eat_t("great scott!")
