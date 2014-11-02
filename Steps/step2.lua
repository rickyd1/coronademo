-- LOAD ELEMENTS AFTER USER IS ON SCREEN
	
	-- Start physics and set gravity
	physics.start()
	physics.setGravity( 0, 4 )
	
	-- Define Default number of shots
	shotsLeft = 32
	-- Define starting number of candy
	totalCandy = 1
	-- Define Gravity Force
	graveForce = 5.5
	
	-- Add our candy count to scoreboard
	myCandy = display.newText("Candy - " .. totalCandy, 0, 0, native.systemFontBold, 24)
	myCandy:setTextColor( 1, 0.5, 0 )
	myCandy.anchorX, myCandy.anchorY = 0, 1
	myCandy.x, myCandy.y = screenW -200, screenH -10
	
	-- Add Ammo count to scoreboard
	myAmmo = display.newText("Rounds - " .. shotsLeft, 0, 0, native.systemFontBold, 24)
	myAmmo:setTextColor( 1, 0.5, 0 )
	myAmmo.anchorX, myAmmo.anchorY = 0, 1
	myAmmo.x, myAmmo.y = 10, screenH - 10
	
	-- create a Streamer object and add physics (with custom shape)
	local streamer = display.newRect( 0, 0, screenW, 83 )
	streamer:setFillColor( 0.2 )
	streamer.anchorX, streamer.anchorY = 0, 0
	streamer.x, streamer.y = 0, 0	
	streamer.objectName = "Streamer"
	physics.addBody( streamer, "static", { friction=0.3, shape=streamerShape } )