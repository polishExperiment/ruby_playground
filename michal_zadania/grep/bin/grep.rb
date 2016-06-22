#!/usr/bin/env ruby

def self.colorize text, color_code
  "\e[#{color_code}m#{text}\e[0m"
end

require 'optparse'

options = {}

OptionParser::new do |opts|
  opts.banner = <<-bannertext

Script and a class that converts and computes reverse polish notation
Usage: onp.rb file

  bannertext

  opts.on("-E", "--extended-regexp", "Use extended regular expression") do |e|
    options[:regexp] = e
  end
end.parse!

needle = ARGV.shift

if ARGV.empty?
  puts colorize("Error: You need to pass name of the file",31)
  exit 0
else
  ARGV.each do |filename|
    File::open filename do |file|
      file.each do |line|
        if options[:regexp]
          print Grep::colorize line, 31 if /#{needle}/ =~ line
        else
          print Grep::colorize line, 31 if line.include? needle
        end
      end
    end
  end
end
