--[[
============================================================
                 STEP 13                 
============================================================
 
We need to increase the diffuctly of the game. We are going to
speed things up by adjusting the gravity
                                
============================================================
                 RESOURCES
============================================================

	physics.setGravity:
	
	http://docs.coronalabs.com/api/library/physics/setGravity.html
	

--]]


--[[
============================================================
                      PART A
============================================================
	
	File we are working with: level1.lua
	
	locate:	before the candy update function

		
============================================================
--]]
--Speed up level
local function speedUp()
	graveForce = graveForce - .2
	print(graveForce)
	physics.setGravity( 0, graveForce )
	local gx, gy = physics.getGravity()
	print( "X gravity: " .. gx .. ", Y gravity: " .. gy )
end

--[[
============================================================
                      PART B
============================================================
	
	File we are working with: level1.lua
	
	locate: scene:show 
					elseif phase == "did" then

	Place at the bottom with the otehr timers
============================================================
--]]

-- Make level harder		
leveUp = timer.performWithDelay(4000, speedUp, 100)