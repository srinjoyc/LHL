def bark 
    puts "WOOF WOOF WOOF"
end 

def stop 
    puts "Shakil stopped"
end 

def meow 
    puts "woof woof woof woof woof"
end 

def treat 
    puts "Shakil thinks he will get a treat "
end 

def go_away
    puts "Shakil has left"
end 

away=false

until away == true do 
    user_action = gets.chomp 

    if user_action == "bark" 
        bark 
    end 

    if user_action == ("shakil stop" || "Shakil STOP!" )
        stop
    end 

    if user_action == "meow" 
        meow
    end 

    if user_action == "go away" 
        go_away
        away=true
    end 
end 
