--[[
============================================================
                 STEP 10              
============================================================
 
We are going to continue our conditions for the collision funciton
                                
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
	
	locate:	before the closing of 
	
	if event.object1.objectName == "balloon" and event.object2.objectName == "bullet" then 
	
					
	we are going to add this elseif statement prior to the end tag of the intial if statment.
		
============================================================
--]]

-- Set Collision between gain balloon and bullet
elseif event.object1.objectName == "gainBalloon" and event.object2.objectName == "bullet" then 	
	event.object1:removeSelf()	
	-- add Shots
	shotsValue = event.object1.shots
	if shotsValue ~= nil then
		shotsLeft = shotsLeft + shotsValue
		upDateAmmo()
	end