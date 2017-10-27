#!/usr/bin/env ruby

# Separates students who pass from students who fail
# First argument is a hash of students and scores
# Second argument is a score threshold that separates passes from fails
def passed_or_failed(hash, threshold)
  passed = Hash.new
  failed = Hash.new
  passed_failed = Hash.new

  hash.each_pair do |first_name, score|
    score.to_i >= threshold.to_i ? passed[first_name] = score : failed[first_name] = score
  end

  passed_failed[:passed], passed_failed[:failed] = passed, failed
  passed_failed
end

# Example usage for convenience
hash = {Mark: 10, Ellen: 65, Roger: 20, Mike: 70}
puts passed_or_failed(hash, '65')
