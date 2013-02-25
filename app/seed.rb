require './song.rb'
require 'awesome_print'

Song.auto_migrate_down!
Song.auto_migrate_up!
Song.create(title:        "Come Fly With Me", 
            lyrics:       "Come fly with me, let's fly, let's fly away ... .", 
            length:       199, 
            released_on:  Date.new(1958,1,6))
Song.create(title:        "My Way",
            lyrics:       "My Way ...",
            length:       207, 
            released_on:  Date.new(1969,3,9))

puts '---'
puts "Song.count = #{Song.count}"
puts "---"
puts "Song.first"
ap Song.first.attributes.to_hash


