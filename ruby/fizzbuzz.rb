
#Fizzbuzz

def Fizz 
	array=[]
	counter=0
	for i in 1..100
		if i % 3 ==0 
			array[i]= "Fizzbuzz"
			counter+=1
		else
		
		array[i]=i
		
		end
	end
	puts counter
	return array
end 

 fizzarr=Fizz()
 puts fizzarr

