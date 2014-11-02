--[[
============================================================
                 STEP 22       
============================================================
 
We are going to remove elements from our level after the game
is over and we leave the screen
                                
============================================================
                 RESOURCES
============================================================

	object:removeEventListener():
	
	http://docs.coronalabs.com/api/type/EventListener/removeEventListener.html
	
	timer.cancel():
	
	http://docs.coronalabs.com/api/library/timer/cancel.html
	
	physics.stop(): 
	
	http://docs.coronalabs.com/api/library/physics/stop.html
	
	
--]]


--[[
============================================================
                      PART A
============================================================
	
	File we are working with: level1.lua
	
	locate:	function scene:hide( event )
					if event.phase == "will" then
	
	Add add code inside conditional statement
============================================================
--]]

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