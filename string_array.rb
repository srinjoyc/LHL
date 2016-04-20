# length of strings 

def length_finder(input_array)
 out=[]
  input_array.each { |x| 
    out.push(x.length)
  }
  return out
end

puts length_finder(arr)