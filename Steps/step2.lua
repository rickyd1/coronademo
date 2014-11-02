--[[
============================================================
                 STEP TWO                  
============================================================
 
At this stage we are going to add elements to our scene:show()
                                
============================================================
                 RESOURCES
============================================================

Composer:
http://docs.coronalabs.com/api/library/composer/index.html 

Physics:
http://docs.coronalabs.com/daily/api/library/physics/index.html 

--]]


--[[
============================================================
                      PART A
============================================================
	
	File we are working with: level1.lua
	
	locate: scene:show 
					if phase == "will" then
	
	We will be loading the cannon prior to the screen loading
============================================================
--]]

	-- create a cannon
	cannon = display.newImageRect("assets/d-canon.png", 41, 58 )
	cannon.anchorX = 0.5
	cannon.anchorY = 1
	cannon.x, cannon.y = display.contentWidth * .5, display.contentHeight - 70
	
	sceneGroup:insert( cannon )

--[[
============================================================
                      PART B
============================================================
	
	File we are working with: level1.lua
	
	locate: scene:show 
					elseif phase == "did" then
	
	We will be loading the cannon prior to the screen loading
============================================================
--]]

	
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