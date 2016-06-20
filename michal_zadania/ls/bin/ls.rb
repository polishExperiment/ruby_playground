#!/usr/bin/env ruby

# This works for bare 'ls' and partially for 'ls -l'


# please ignore this from here --------------------

#puts sprintf("%o",File.world_readable?('kaka'))
# puts "\n\n\n\n"
#
=begin
s =  File.stat('kaka')
puts s.inspect
puts "\n\n\n\n"
s.mode
puts sprintf("%o", s.mode)
puts s.uid
puts s.gid
=end
# till here ( I will probably need some of that)------

arguments = ARGV

if arguments.length > 1
  puts 'You can\'t pass more than one argument'
  exit 0
end

argument = arguments.first

if argument.nil?
  Dir.glob('*').sort.each {|file| print "#{file}  "}

  print "\n"
  exit 0
end


# identify passed options if there is an argument at all
if argument =~ /-[a-zA-Z0-9]+/
  argument_chars = argument.chars

  # remove '-' from arguments' characters
  argument_chars.shift

  if argument_chars.count('l') > 0
    Dir::glob('*').sort.each do |file|
      if File::file? file
        print '-'
      else
        print 'd'
      end

      permissions = File::world_readable? file

      if permissions.nil?
        print '-' * 9
      else
        permissions = sprintf "%o", permissions
        permissions = permissions.to_s.chars
        permissions[0]
      end

      puts "rw-rw-r-- 1 visuality visuality 777 maj 11 15:44 #{file}"
    end
  end

else
  puts 'You need to pass argument in the form of hyphen followed by parameters as in "-la"'
  exit 0
end
