#!/usr/bin/env ruby

needle, filename = ARGV

unless needle && filename
  puts 'You need to pass needle and filename argument'
  exit 0
end

def colorize text, color_code
  "\e[#{color_code}m#{text}\e[0m"
end

File::open filename do |file|
  while line = file.gets
    print colorize line, 31 if line.include? needle
  end
end

