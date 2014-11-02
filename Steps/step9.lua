-- Update Candy Count
local function updateCandyCount()	
	myCandy.text = "Candy - " .. totalCandy
	myCandy.x, myCandy.y = screenW -100, screenH -10
end

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


-- Listen for ball balloon collision
Runtime:addEventListener( "collision", onCollision )