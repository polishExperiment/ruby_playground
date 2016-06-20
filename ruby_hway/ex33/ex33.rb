def while_loop(i, max, numbers, increment)

  (i .. max).each { |i|
    numbers.push(i)
    puts "At the top i is #{i}"

    i += increment

    puts "Numbers now: ", numbers
    puts "At the bottom i is #{i}"
  }
end

i = 0
max = 6
numbers = []
increment = 2

while_loop(i, max, numbers, increment)  


puts "The numbers: "

# remember you can write this 2 other ways?
numbers.each {|num| puts num }
