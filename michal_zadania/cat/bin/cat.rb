#!/usr/bin/env ruby

require 'optparse'

def colorize text, color_code
  "\e[#{color_code}m#{text}\e[0m"
end

options = {}

OptionParser::new do |opts|
  opts.banner = <<-bannertext

Ruby implementation of unix cat command
Usage: cat.rb file1 file2 file3...

                bannertext
end.parse!

if ARGV.empty?
  puts colorize("Error: You need to pass name of the file",31)
  exit 0
else
  ARGV.each do |filename|
    File::open filename do |file|
      file.each do |line|
        print line
      end
    end
  end
end
