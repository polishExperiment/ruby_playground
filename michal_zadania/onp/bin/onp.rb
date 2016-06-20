#!/usr/bin/env ruby

# todo write it as a class/classes

OPERATOR_REGEX = /[+\-*\/^]/
NUMBER_REGEX = /[0-9]/
OPERATOR_PRIORITIES = { '^' => 4,
                        '*' => 3, '/' => 3,
                        '+' => 2, '-' => 2,
                        '=' => 1,
                        '(' => 0, ')' => 0 }

def extract_number index, symbols
  number_string = ''

  while symbols[index] =~ /[0-9]/
    number_string += symbols[index]
    index += 1
  end

  return number_string
end

def convert_to_onp chars
  output = []
  stack = []
  error = nil

  index = 0

  breakpoint = chars.length

  loop do
    case
      when chars[index] == '('
        stack.push chars[index]
        index += 1
      when chars[index] == ')'
        until stack.last == '('
          output.push stack.pop
        end
        stack.pop
        index += 1
      when chars[index] =~ NUMBER_REGEX
        number = extract_number index, chars
        index += number.length
        output.push number
      when chars[index] =~ OPERATOR_REGEX
        while stack.last && OPERATOR_PRIORITIES[stack.last] >= OPERATOR_PRIORITIES[chars[index]]
          output.push stack.pop
        end
        stack.push chars[index]
        index += 1
      when chars[index] =~ /\s/
        index += 1
      else
        error = "Program encountered unrecognized character: '#{chars[index]}'"
        break
    end
    break if index >= breakpoint
  end

  until stack.empty?
    output.push stack.pop
  end

  return error ? error : output
end

filename = ARGV.first

unless filename
  puts "You need to pass filename argument to the script"
  exit 0
end

File::open filename do |file|

  file.readlines.each do |line|
    line = line.chomp

    onp = convert_to_onp line.chars

    if !onp.is_a? String
      print line, " becomes "
      onp.each {|element| print element + ' '}
      print "\n"
    else
      puts onp
    end
  end
end

