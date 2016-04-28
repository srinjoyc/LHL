$roman_nums = {1 => "I",
              4 => "IV",
              5 => "V",
              9 => "IX",
              10 => "X",
              40 => "XL",
              50 => "L",
              90 => "XC",
              100 => "C",
              400 => "CD",
              500 => "D",
              900 => "CM",
              1000 => "M" }

def to_roman(num)
  answer=[]
  leftover=0
 while num!=0 do
   $roman_nums.reverse_each do |x, val|
     if(num>=x)
       num-=x
       answer.push(val)

     end
   end
 end
  answer
end

# Drive code... this should print out trues.

puts to_roman(472)


# TODO: what other cases could you add to ensure your to_roman method is working?