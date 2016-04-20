
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
   end 
   
end

Calculator = Calc. new
 result= Calculator.add(10,2)
 
 puts result