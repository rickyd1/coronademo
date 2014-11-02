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

-- Add Spawn Timer
gainBalloons = timer.performWithDelay(8000, spawnGainBalloon, 60)	