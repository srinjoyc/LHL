# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'
require 'pp'

## Your test code can go here

# binding.pry


#qualified = qualified_candidates(@candidates)

#ordered_qualified_candidates= qualified_candidates(qualified)

puts ordered_by_qualifications(@candidates)
