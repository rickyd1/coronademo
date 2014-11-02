--Speed up level
local function speedUp()
	graveForce = graveForce - .2
	print(graveForce)
	physics.setGravity( 0, graveForce )
	local gx, gy = physics.getGravity()
	print( "X gravity: " .. gx .. ", Y gravity: " .. gy )
end
-- Make level harder		
leveUp = timer.performWithDelay(4000, speedUp, 100)