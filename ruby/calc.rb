#!/usr/bin/env ruby
class Calc
   def add(a,b)
   		c=0
   		c=a+b
   		return c
      puts "added!"
   end
   
   def sub(a,b)
   	c=0
   	c= a-b
   	
   	return c
   	puts "subtracted!"
  # end 
   
end

Calculator = Calc. new
puts "Please enter a number to add"
num1= gets.chomp.to_i
puts "Please enter another number to add"
num2= gets.chomp.to_i


 result= Calculator.add(num1,num2)
 
 puts result
