#!/usr/bin/env ruby

ROMAN_TO_DEC = { 'I' => 1,
                'IV' => 4,
                'V' => 5,
                'IX' => 9,
                'X' => 10,
                'XL' => 40,
                'L' => 50,
                'XC' => 90,
                'C' => 100,
                'CD' => 400,
                'D' => 500,
                'CM' => 900,
                'M' => 1000 }

DOUBLE_ROMAN = ['IV', 'IX', 'XL', 'XC', 'CD', 'CM']

def validate_roman? line
  line.chars.each do |char|
    return false unless ROMAN_TO_DEC.key? char
  end

  return true
end

def roman_to_dec line
  sum = 0
  chars = line.chars

  i = 0
  i_end = chars.length

  loop do
    if i+1 < i_end && DOUBLE_ROMAN.include?(chars[i] + chars[i+1])
      sum += ROMAN_TO_DEC[chars[i] + chars[i+1]]
      i += 1
    elsif i+1 <= i_end
      sum += ROMAN_TO_DEC[chars[i]]
    else
    end

    i += 1
    break if i >= i_end
  end

  return sum > 0 ? sum : 'empty line'
end

####################################### body

filename = ARGV.first

File::open filename do |file|
  while line = file.gets
    line = line.chomp

    if validate_roman? line
      puts roman_to_dec line
    else
      puts "Not a roman numeral"
    end
  end
end
