-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "composer" module
local composer = require "composer"

-- load menu screen
composer.gotoScene( "menu" )

-- Add to main.lua
fireSound = audio.loadSound( "assets/fire.caf" )
unloadSounds = function()
	
	audio.stop()
	
	if fireSound then
		audio.dispose( fireSound )
		fireSound = nil
	end
end
popSound = audio.loadSound( "assets/pop.caf" )
unloadSounds = function()
	
	audio.stop()
	
	if popSound then
		audio.dispose( popSound )
		popSound = nil
	end
end