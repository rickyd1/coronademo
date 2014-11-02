-- Add Shoot Feature To load Screen
Runtime:addEventListener("touch", shoot)

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