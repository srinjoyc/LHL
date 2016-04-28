
states = {
    OR: 'Oregon',
    FL: 'Florida',
    CA: 'California',
    NY: 'New York',
    MI: 'Michigan'
}
cities = {}
@taxes = {}

city_index =0
list_of_cities = ['City A', 'City B', "City C", "City D", "City E", "City F", "City G", "City H", "City I", "City J", "City K", "City L", "City M", "City N"]
states[:WY] = 'Wyoming'
states[:MT] = 'Montana'

states.each_key { |state|
  if cities[state] == nil
     cities[state]=[]
  end

  cities[state].push(list_of_cities[city_index])
  cities[state].push(list_of_cities[city_index+1])
  city_index += 2

  @taxes[state]= rand(100)
}

def calculate_taxes(state,money)
  tax_rate = (@taxes[state.to_sym]).to_f/100
  tax = money*tax_rate
  return tax.round(3)
end

  puts "What state are you interested in?"
  state_choice = gets.chomp
  states.each_pair { |state,name|
    if state.to_s == state_choice
      puts "You have selected #{name}"
      puts "This state has #{cities[state].size} cities:"
      cities[state].each { |city| puts " - #{city} " }
      puts "This state has the following taxes: #{@taxes[state]} %"
    end
  }

  puts "What state do you want to calculate taxes in?"
  state_choice = gets.chomp
  puts "How much did you spend?"
  tax_choice = gets.chomp.to_i

  puts "You owe $" + calculate_taxes(state_choice,tax_choice).to_s + " to the state"

  puts "Which city are you looking for?"
  city_choice = gets.chomp
  @state_key=" "
  state_key= cities.select { |key, val|
    if val == city_choice
      @state_key = key.to_s
    end  }

  puts @state_key



