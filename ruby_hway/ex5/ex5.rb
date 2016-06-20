name = 'Zed A. Shaw'
age = 35 # not a lie in 2009
height = 74 # inches
weight = 180
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'
inch_to_cm_multiplier = 2.54
pound_to_kg_multiplier = 0.453592

puts "Let's talk about #{name}."
puts "He's #{height} inches tall."
puts "He's #{weight} pounds heavy."
puts "Actually that's not too heavy."
puts "He's got #{eyes} eyes and #{hair} hair."
puts "His teeth are usually #{teeth} depending on the coffe."

# this line is tricky, try to get it exactly right
puts "If I add #{age}, #{height * inch_to_cm_multiplier}, and #{weight * pound_to_kg_multiplier} I get #{age + height + weight}."
