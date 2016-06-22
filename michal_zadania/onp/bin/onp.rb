#!/usr/bin/env ruby

# stateless class that converts arithmetic expressions to
# reverse polish notation and calculates them
class Rpn

  OPERATOR_REGEX = /[+\-*\/^]/
  NUMBER_REGEX = /[0-9]/
  OPERATOR_PRIORITIES = { '^' => 4,
                          '*' => 3, '/' => 3,
                          '+' => 2, '-' => 2,
                          '=' => 1,
                          '(' => 0, ')' => 0 }

  # takes array, returns string error or string with converted line
  def self.convert_to_rpn chars
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

    error ? error : output
  end

  # compute RPN expression
  # input: RPN expression
  # output: computed result pf the expression
  def self.count rpn
    stack = []

    rpn.each do |element|

      case element
      when OPERATOR_REGEX
        num1 = stack.pop.to_f
        num2 = stack.pop.to_f
        case element
        when '+'
          stack.push num1 + num2
        when '-'
          stack.push num1 - num2
        when '^'
          stack.push num1 ** num2
        when '/'
          stack.push num1 / num2
        when '*'
          stack.push num1 * num2
        end
      else
        stack.push element
      end
    end
    stack
  end

  def self.colorize text, color_code
    "\e[#{color_code}m#{text}\e[0m"
  end

  # input: array of symbols and index at which number starts
  private
  def self.extract_number index, symbols
    number_string = ''

    while symbols[index] =~ NUMBER_REGEX
      number_string += symbols[index]
      index += 1
    end

    number_string
  end
end


#-----------------------Body of script--------------------------


require 'optparse'

options = {}

OptionParser::new do |opts|
  opts.banner = <<-bannertext

Script and a class that converts and computes reverse polish notation
Usage: onp.rb file

  bannertext
end.parse!

if ARGV.empty?
  puts Rpn::colorize("Error: You need to pass name of the file",31)
  exit 0
else
  ARGV.each do |filename|
    File::open filename do |file|
      file.each do |line|
        line = line.chomp

        rpn = Rpn::convert_to_rpn line.chars

        if !rpn.is_a? String
          print Rpn::colorize(line, 33), " becomes "
          rpn.each {|element| print Rpn::colorize(element + ' ', 32)}
          print " which computes to "
          print Rpn::colorize(Rpn::count(rpn), 32)
          print "\n"
        else
          puts Rpn::colorize(rpn, 31)
        end
      end
    end
  end
end
