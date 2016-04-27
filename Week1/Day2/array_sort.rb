def sort (arr)
  index=0

  4.times do
    if  arr[index] < arr[index+1]
           arr[index], arr[index+1] = arr[index+1], arr[index]
    end
    puts index
    index += 1
  end
  return arr
end

arr = [ 5, 6, 9, 2, 1]

puts sort(arr).to_s