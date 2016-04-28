def average(numbers)

  if numbers == [] || numbers == nil
    return nil
  end
  sum = 0
  arr_size = numbers.size
  numbers.each do |num|
    if num == nil
      arr_size=arr_size-1
      next
    end
    sum += num.to_f
  end
   sum/ arr_size
end

## TEST HELPER METHOD
def test_average(array=[])
  print "avg of #{array.inspect}:"

  result = average(array)
  p result
end

## TEST CODE
test_average([4,5,6]) # => 5
test_average([15,5,10]) # => 10

# Should treat string like number
test_average([15,'5',10]) # => 10

# Should show decimal value
test_average([10, 5]) # => 7.5 instead of just 7

# Watch out! Even tests can have bugs!
test_average([9, 5, 7])

# Empty set should return nil, not throw an error
test_average([]) # => nil

# Non-existent set should return nil
test_average() # => nil

# BONUS: Should ignore nils in the set
test_average([9,6,nil,3]) # => 6