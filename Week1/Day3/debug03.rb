def sum(list)
  add = 0
  list.each do |ele|
    add += ele
  end

  return add
end

def diff_sum (list=[])
  if list == [] || list == nil
    return nil
  end
  list=list.reject { |num|  num == nil}
  list.inject { |num, total| num + total }

end

list1 = [16,21,nil,31,42,55]

# 1. The following should return 165 instead of an error
#puts sum(list1)
puts diff_sum(list1)

# 2. How would you refactor it using an enumerable method other than each? Examples of enumerables: map, select, inject, reject, detect.


