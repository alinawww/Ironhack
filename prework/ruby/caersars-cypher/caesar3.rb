def solve_cipher(input, 3)
    letters = input.split(//)
    letters.each do |letter|
        order = letter.ord
        if letter == " "
            new_order = order.to_i
            else
            new_order = order.to_i + shift
        end
        print new_order.chr
    end
end

solve_cipher("p| uhdo qdph lv grqdog gxfn", -3)