#!/usr/bin/env ruby

unless filename = ARGV.first
  puts "You need to pass name of the file"
  exit 0
end


File::open filename do |file|
  print file.read
end

