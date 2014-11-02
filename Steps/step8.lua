--[[
============================================================
                 STEP 8                  
============================================================
 
At this stage we are going to spawn some balloons that give us 
more ammo and increase our score
                                
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
	
	locate: Place code after spawn ballon funciton from step 7
		
============================================================
--]]

-- Spawn Double Balloon
local function spawnDoubleBalloon(event)
	local randomPos = screenW - math.random(screenW - 60)
	-- make a balloon (off-screen), position it, and rotate slightly
	local balloon = display.newImageRect( "assets/red-balloon.png", 60, 71 )
	balloon.x, balloon.y = randomPos, display.contentHeight - 100
	balloons:insert( balloon )
	balloon.rotation = 1
	balloon.shots = 5
	balloon.candy = 5
	balloon.objectName = "doubleBalloon"
	-- add physics to the balloon
	physics.addBody( balloon, { density=4.0, friction=1.0, bounce=0.3 } )
	balloon:applyForce( 100, -2000, balloon.x, balloon.y )
end


--[[
============================================================
                      PART B
============================================================
	
	File we are working with: level1.lua
	
	locate: scene:show 
					elseif phase == "did" then
					
	Place code at bottom of funtions area after the timer used in step 7
		
============================================================
--]]

-- Set Timer
doubleBalloons = timer.performWithDelay(15000, spawnDoubleBalloon, 30)