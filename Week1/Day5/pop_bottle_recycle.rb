def empty_bottles(empty)
  return (empty/2).floor
end

def bottle_caps(caps)
 return (caps/4).floor
end

def calc_total_bottles(bottles)
  if bottles > 2
    $empty= empty_bottles(bottles)
    $caps = bottle_caps(bottles)
    $free_bottles= $empty + $caps
    $total_bottles += $free_bottles
  end
  $empty=0
  $caps=0
  return $free_bottles
end

def breakdown(money)
  puts "Purchased Bottles: #{@bottles}"
  puts "Free bottles from empty bottles: #{@empty}"
  puts "Free bottles from bottle caps: #{@caps}"
  puts "Total bottles recived: #{@total_bottles}"

end

$empty = 0
$caps = 0
$free_bottles = 0

loop do

  puts "How much money would like to spend on bottles?"
  money = gets.chomp
  $total_bottles = money.to_i/2
  bottles_left=$total_bottles
  while bottles_left > 1 do
  bottles = calc_total_bottles(bottles_left)
  bottles_left = calc_total_bottles(bottles)
  end
puts $total_bottles
end

