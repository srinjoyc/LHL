
def comparearrays (arr1)

	non_dup_arr=[]
	
	arr1.each { |x| 

		if non_dup_arr.include? x
			
		else
			non_dup_arr.push(x)
		end

	}
	
	puts  non_dup_arr
end


arr=[1,2,3,3,4,5,5]

comparearrays(arr)