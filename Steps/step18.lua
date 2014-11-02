--[[
============================================================
                 STEP 18            
============================================================
 
We are going to add the function to level1 that will send the
intiate the game over event.
                                
============================================================
                 RESOURCES
============================================================
	
	composer.gotoScene():

	http://docs.coronalabs.com/api/library/composer/gotoScene.html

--]]


--[[
============================================================
                      PART A
============================================================
	
	File we are working with: level1.lua
	
	locate:	prior to speedup function
	
		
============================================================
--]]


-- Add Game over function
local function gameOver()	
	-- load results
	composer.gotoScene( "gameresults", "fade", 500 )
end

--[[
============================================================
                      PART B
============================================================
	
	File we are working with: level1.lua
	
	locate:	timer.performWithDelay( 500, gameOver )
	
	uncomment from shoot function
============================================================
--]]

timer.performWithDelay( 500, gameOver )