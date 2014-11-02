-- Convert with terminal first
afconvert -f caff -d LEI16 {INPUT} {OUTPUT}


-- Add bullet sound
audio.play(fireSound)

-- Add to main.lua
fireSound = audio.loadSound( "assets/fire.caf" )
unloadSounds = function()
	
	audio.stop()
	
	if fireSound then
		audio.dispose( fireSound )
		fireSound = nil
	end
end