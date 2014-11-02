--[[
============================================================
                 STEP 16           
============================================================
 
We are going to add functionality to our gameover.lua file. 
If this file is not created, you will need to create file with this
name. It should have the same template as level1.lua had in step one.
                                
============================================================
                 RESOURCES
============================================================


--]]


--[[
============================================================
                      PART A
============================================================
	
	File we are working with: level1.lua
	
	locate:	scene:create( event )
		
============================================================
--]]


	-- create a rectangle as the backdrop
	local background = display.newRect( 0, 0, screenW, screenH )
	background.anchorX = 0
	background.anchorY = 0
	local gradient = {
	    type="gradient",
	    color1={ 105/255, 164/255, 192/255 }, color2={ 4/255, 64/255, 92/255 }, direction="down"
	}
	background:setFillColor( gradient )
	
	
	-- display a score background
	local scoreboard = display.newRect( 0, 0, 584, 371 )
	scoreboard:setFillColor( 200/255, 164/255, 192/255 )
	scoreboard.anchorX, scoreboard.anchorY = 0.5, 0
	scoreboard.x, scoreboard.y = halfW, 110