def solve_cipher(input)
    letters = input.split(//)
    letters.each do |letter|
        order = letter.ord
        new_order = order.to_i - 1
        print new_order.chr
    end
end

solve_cipher("ifmmp")