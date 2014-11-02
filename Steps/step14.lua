--[[
============================================================
                 STEP 14               
============================================================
 
We are going to add some adio functionality
                                
============================================================
                 RESOURCES
============================================================

	audio.play:
	
	http://docs.coronalabs.com/api/library/audio/play.html
	
	audio.loadSound():
	
	http://docs.coronalabs.com/api/library/audio/loadSound.html
--]]

--[[
============================================================
                      PART A
============================================================
	
	Convert you files to caf audio files for iOS
	
	On a mac, you can run the following within terminal to convert
	your audio file.
	
	afconvert -f caff -d LEI16 {INPUT} {OUTPUT}
		
============================================================
--]]



--[[
============================================================
                      PART B
============================================================
	
	File we are working with: main.lua
	
	locate:	composer.gotoScene( "menu" )
	
	paste audio info below this function
		
============================================================
--]]

-- Add to main.lua
fireSound = audio.loadSound( "assets/fire.caf" )
unloadSounds = function()
	
	audio.stop()
	
	if fireSound then
		audio.dispose( fireSound )
		fireSound = nil
	end
end

--[[
============================================================
                      PART C
============================================================
	
	File we are working with: level1.lua
	
	locate:	if shotsLeft >= 1 then
	
	this line will be in the shoot function we will add the adio
	play prior to the closing of this conditional statement
		
============================================================
--]]

-- Add bullet sound
audio.play(fireSound)