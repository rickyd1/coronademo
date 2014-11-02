--[[
============================================================
                 STEP 7                  
============================================================
 
At this stage we are going to spawn some balloons that give us more ammo
                                
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
	
	locate: Place code after spawn ballon funciton from step 6
		
============================================================
--]]
-- Spawn balloons set two
local function spawnGainBalloon(event)
	local randomPos = screenW - math.random(screenW - 60)
	-- make a balloon (off-screen), position it, and rotate slightly
	local balloon = display.newImageRect( "assets/green-balloon.png",  60, 71 )
	balloon.x, balloon.y = randomPos, display.contentHeight - 100
	balloons:insert( balloon )
	balloon.rotation = 1
	balloon.shots = 5
	balloon.objectName = "gainBalloon"
	-- add physics to the balloon
	physics.addBody( balloon, { density=3.3, friction=5.3, bounce=.1 } )
	balloon:applyForce( 100, -2600, balloon.x, balloon.y )
end

--[[
============================================================
                      PART B
============================================================
	
	File we are working with: level1.lua
	
	locate: scene:show 
					elseif phase == "did" then
					
	Place code at bottom of funtions area after the timer used in step 6
		
============================================================
--]]

-- Add Spawn Timer
gainBalloons = timer.performWithDelay(8000, spawnGainBalloon, 60)	