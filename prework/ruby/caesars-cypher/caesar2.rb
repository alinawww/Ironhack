def solve_cipher(input, shift)
    letters = input.split(//)
    letters.each do |letter|
        order = letter.ord
        if letter == " "
            new_order = order.to_i
        elsif order < 64 && order > 32
            new_order = order.to_i
        else
            new_order = order.to_i + shift
        end
        
        if new_order < 97 && new_order > 90
            print "z"
            else
            print new_order.chr
        end
    end
end

solve_cipher("p| uhdo qdph, lv grqdog gxfn", -3)