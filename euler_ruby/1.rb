result = 0
(1...1000).each do |n|
  if n % 3 ==0 || n % 5 == 0
    result += n
  end
end
puts result
