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

-- Add Spawn Timer
blackBalloons = timer.performWithDelay(1000, spawnBalloon, 0)	