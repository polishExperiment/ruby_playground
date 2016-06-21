#it should have expected worst-case time complexity of O(log(N))
#it should have expected worst-case space complexity of O(1)

def solution n
  gap = 0
  max = 0

  while n > 0 && n % 2 != 1
    n = n / 2
  end

  while n > 0
    if n % 2 == 0
      gap += 1
    else
      if gap > max
        max = gap
      end
      gap = 0
    end
    n = n / 2
  end

  max
end

puts solution(529)
