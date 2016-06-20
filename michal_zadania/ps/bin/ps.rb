#!/usr/bin/env ruby

# Bare 'ps' is much harder than 'ps -aux'.
# Yet - I started with bare ps and plan on soon delivering it
# along with 'ps -aux'

Dir.chdir '/proc'

all_processes = Dir.glob('*').select {|file| file =~ /[0-9]+/ }

all_processes.each do |process_id|
  file = open("/proc/#{process_id}/status")
end

all_processes = all_processes.map {|process_id| process_id.to_i}
puts "PID"
puts all_processes.sort

puts Process.pid
puts "\n\n\n"

puts ENV['USER']
puts Process.euid
