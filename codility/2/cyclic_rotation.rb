def solution a, k
  unless a.empty?
    k.times do
      a.unshift a.pop
    end
  end
  a
end

a = [3,8,9,7,6]
k = 3
puts solution a, k

