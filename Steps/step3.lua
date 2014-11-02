--[[
============================================================
                 STEP THREE                  
============================================================
 
At this stage we are going to add the touch listener to the cannon
                                
============================================================
                 RESOURCES
============================================================

object:addEventListener()
http://docs.coronalabs.com/api/type/EventListener/addEventListener.html

Physics:
http://docs.coronalabs.com/daily/api/library/physics/index.html 

--]]

--[[
============================================================
                      PART A
============================================================
	
	File we are working with: level1.lua
	
	locate: scene:show 
					if phase == "did" then
	
	We will be loading the cannon prior to the screen loading
============================================================
--]]

-- Add Shoot Feature To load Screen
Runtime:addEventListener("touch", shoot)


--[[
============================================================
                      PART B
============================================================
	
	File we are working with: level1.lua
	
	locate: Between required elements and before scene:create( event )
	
	We will be adding the function shoot outside of the composer structure.
	It will be called prior to the scene loading making the touch action accessible.
	
============================================================
--]]
-- Create shoot functions
local function shoot(event)
		if event.phase == "began" then 
			if shotsLeft >= 1 then
				shotsLeft = shotsLeft - 1
				upDateAmmo()
				local bullet = display.newImageRect( "assets/ball.png", 30, 42)			
				bullets:insert( bullet )
				bullet.objectName = "bullet"
				bullet.anchorX, bullet.anchorY = 0, 0
				bullet.x, bullet.y = shooter.x, shooter.y
				physics.addBody(bullet, "dynamic", {density = 8.0, friction = 8.3, bounce = 0, radius =0})				
				bullet:applyLinearImpulse((bullet.x - event.x)*-0.5, (bullet.y - event.y)* -0.5, bullet.x, bullet.y)

			else
				if shotsLeft == 0 then
					-- We will call funciton to end game
					-- timer.performWithDelay( 500, gameOver )
				end
			end
			
		elseif event.phase == "ended" then 		
		 	-- We will rempove the bullet
			--	removeBullets()			
		end	
end