require './main.rb'
require './song.rb'

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
