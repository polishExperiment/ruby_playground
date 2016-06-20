#!/usr/bin/env ruby
filename = ARGV.first

unless filename
  puts "You need to pass filename argument to the script"
  exit 0
end


File::open filename do |file|
  nr_of_lines = File.read(file).scan(/\n/).count
  nr_of_words = File.read(file).split.size
  file_size = file.size

  print "#{nr_of_lines} #{nr_of_words} #{file_size} #{filename}\n"
end
