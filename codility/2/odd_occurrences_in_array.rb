#it should have expected worst-case time complexity of O(N)

#it should have expected worst-case space complexity of O(1),
# beyond input storage (not counting the storage required for input arguments)

def solution a
  a.sort!
  until a.empty?
    answer = a.pop
    return answer if a.pop != answer
  end
end

a = [9, 3, 9, 3, 9, 7, 9]

puts solution a
