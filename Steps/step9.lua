--[[
============================================================
                 STEP 9              
============================================================
 
We are going to create a listener that listens for a collision between 
physic objects.
                                
============================================================
                 RESOURCES
============================================================

	timer.performWithDelay():
	
	http://docs.coronalabs.com/api/library/timer/performWithDelay.html
	
	Collision Detection:
	
	http://docs.coronalabs.com/daily/guide/physics/collisionDetection/index.html

--]]


--[[
============================================================
                      PART A
============================================================
	
	File we are working with: level1.lua
	
	locate:	scene:show 
					elseif phase == "did" then
					
	Listener will be placed after the timers added in steps 6 - 8
		
============================================================
--]]

-- Listen for ball balloon collision
Runtime:addEventListener( "collision", onCollision )



--[[
============================================================
                      PART B
============================================================
	
	File we are working with: level1.lua
	
	locate:	Immediatly before shoot function
					
	We are going to add our collision function prior to the shoot function
		
============================================================
--]]

-- Deal with Collisions on screen
local function onCollision( event )
	if ( event.phase == "began" ) then
 		if event.object1.objectName == "balloon" and event.object2.objectName == "bullet" then 	
			event.object1:removeSelf()				
			-- collect candy
			candyValue = event.object1.candy
			if candyValue ~= nil then
				totalCandy = totalCandy + candyValue
				updateCandyCount()
			end
			if shotsLeft == 0 then
				timer.performWithDelay( 500, gameOver )
			end
			
 		end		
	elseif ( event.phase == "ended" ) then 
			
	end
end

--[[
============================================================
                      PART C
============================================================
	
	File we are working with: level1.lua
	
	locate:	Immediatly before collision function
					
	We need this function to run prior to the collision function 
	because the collision function will call it.
		
============================================================
--]]

-- Update Candy Count
local function updateCandyCount()	
	myCandy.text = "Candy - " .. totalCandy
	myCandy.x, myCandy.y = screenW -100, screenH -10
end
