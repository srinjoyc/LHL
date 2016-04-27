# must be baller and either furnished or rent cheaper than 2100
def rent?(furnished, rent, baller)
  return (baller && furnished) || (baller && rent <= 2100)
end

puts "Varying Price"
puts rent?(true,2500,true) 
puts rent?(true,2100,true)  
puts rent?(true,1900,true) 
puts "Varying Furnish @ < 2100"
puts rent?(false,1900,true)
puts rent?(true,1900,true)
puts "Varying Furnish @ > 2100"
puts rent?(true,2500,true)
puts rent?(false,2500,true)
puts "Varying Furnish @ 2100"
puts rent?(true,2100,true)
puts rent?(false,2100,true)
puts "Varying Baller @ < 2100"
puts rent?(true,1900,false)
puts rent?(true,1900,true)
puts "Varying Baller @ > 2100"
puts rent?(true,2500,true)
puts rent?(true,2500,false)
puts "Varying Baller @ 2100"
puts rent?(true,2100,false)
puts rent?(true,2100,true)
puts "Varying furnish false @ > 2100"
puts rent?(false,2500,true)
puts rent?(false,2500,true)
puts "Varying furnish false @ < 2100"
puts rent?(false,1900,true)
puts rent?(false,1900,true)
puts "Varying furnish false @  2100"
puts rent?(false,2100,true)
puts rent?(false,2100,true)
uts "Varying baller false @ > 2100"
puts rent?(true,2500,false)
puts rent?(true,2500,false)
puts "Varying baller false @ < 2100"
puts rent?(true,1900,false)
puts rent?(true,1900,false)
puts "Varying baller false @  2100"
puts rent?(true,2100,false)
puts rent?(true,2100,false)

###
# Add your "test" ("driver") code below in order to "test drive" (run) your method above...
# The test code will call the method with different permutations of options and output the result each time.
# This way, you will be able to run the renter.rb file from the CLI and look at the output of your "tests" to validate if the method works.
# Without the test code, it will be hard for you to know if this method is working as it should or not.
###