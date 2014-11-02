-- Convert with terminal first
afconvert -f caff -d LEI16 {INPUT} {OUTPUT}

-- Add bullet sound
audio.play(popSound)	

-- Add to main.lua
popSound = audio.loadSound( "assets/pop.caf" )
unloadSounds = function()
	
	audio.stop()
	
	if popSound then
		audio.dispose( popSound )
		popSound = nil
	end
end