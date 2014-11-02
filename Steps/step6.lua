--[[
============================================================
                 STEP 6                  
============================================================
 
At this stage we are going to spawn some balloons
                                
============================================================
                 RESOURCES
============================================================

timer.performWithDelay():

http://docs.coronalabs.com/api/library/timer/performWithDelay.html

--]]


--[[
============================================================
                      PART A
============================================================
	
	File we are working with: level1.lua
	
	locate: Place code after shoot function
		
============================================================
--]]

-- Spawn some basic balloons
local function spawnBalloon(event)
	local randomPos = screenW - math.random(screenW - 60)
	-- make a balloon (off-screen), position it, and rotate slightly
	local balloon = display.newImageRect( "assets/black-balloon.png", 60, 71 )
	balloon.x, balloon.y = randomPos, display.contentHeight - 100		
	balloons:insert( balloon )
	balloon.rotation = 1
	balloon.candy = 3
	balloon.objectName = "balloon"
	-- add physics to the balloon
	physics.addBody( balloon, { density=4.0, friction=0.8, bounce=1.3 } )
	balloon:applyForce( 100, -2400, balloon.x, balloon.y )
end

--[[
============================================================
                      PART B
============================================================
	
	File we are working with: level1.lua
	
	locate: scene:show 
					elseif phase == "did" then
					
	Place code at bottom of funtions area
		
============================================================
--]]
-- Add Spawn Timer
blackBalloons = timer.performWithDelay(1000, spawnBalloon, 0)	