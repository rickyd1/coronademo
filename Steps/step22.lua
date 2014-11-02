-- REMOVE LEVEL ITEMS

	physics.stop()
	Runtime:removeEventListener("touch", shoot)
	timer.cancel(blackBalloons)	
	timer.cancel(orangeBalloons)
	timer.cancel(doubleBalloons)
	timer.cancel(leveUp)
	Runtime:removeEventListener( "collision", onCollision )

	-- remove black balloons
	for i=balloons.numChildren, 1, -1 do 
	  local balloon = balloons[i]
	    if balloon then
	    	balloon:removeSelf()
	  end
	end

	-- remove bullets
	for i=bullets.numChildren, 1, -1 do 
	  	local bullet = bullets[i]
	         bullet:removeSelf()
	end

	display.remove( myCandy )		
	display.remove( myAmmo )
	display.remove( background )
	display.remove( streamer)	
	display.remove( shooter )		
	display.remove( scorePanel )

	audio.stop(gameMusic)