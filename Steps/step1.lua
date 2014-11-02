--[[
============================================================
                 STEP ONE                  
============================================================
 
At this point you should have already generated a new composer app using the CoronaSDK app.
You should access  level1.lua and clear out the existion variables while leaving the composer functions in place. 

In addition, physics functions should remain within the composer template.
                                
============================================================
                 RESOURCES
============================================================
You Base file should be similar to the template on the composer documentation page.

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
	
	locate: physics.start(); physics.pause()
	
	Below this line we are going to set the scale for the app.
	
	setScale:
	
	Sets the internal pixels-per-meter ratio that is used in converting between
	on-screen Corona coordinates and simulated physics coordinates. This should be 
	done only once, before any physical objects are instantiated.
	
	syntax: physics.setScale( value )
============================================================
--]]

-- SET SCALE 
physics.setScale( 52 )


--[[
============================================================
                      PART B
============================================================

	File we are working with: level1.lua
	
	locate:	function scene:create( event )
	
	Within this section we are going to place our intial grahpics and variables that
	will not change
	
	Concepts covered
	
	scene:create() - 
	
	When a scene is loaded and it does not have an associated self.view established, 
	Composer will dispatch an event to the scene's local scene:create() function. 
	If the scene's view already exists, the create event is skipped because, by default, 
	Composer tries to keep the scene's view in memory, assuming you will return to the 
	scene at some point. Thus, the scene:create() function may not be executed every 
	time the scene is shown.
	
	
	display.newRect - 
	
	Creates a rectangle object. The local origin is at the center of the rectangle; 
	the anchor point is initialized to this local origin.
	
	display.newImageRect - 
	
	Displays an image on the screen from a file
	
	physics.addBody()
	
	This function turns almost any Corona display object into a simulated physical object
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


-- create a grass object and add physics (with custom shape)
local grass = display.newImageRect( "assets/grass.png", screenW, 82 )
grass.anchorX = 0
grass.anchorY = 1
grass.x, grass.y = 0, display.contentHeight

-- define a shape that's slightly shorter than image bounds (set draw mode to "hybrid" or "debug" to see)
local grassShape = { -halfW,-34, halfW,-34, halfW,34, -halfW,34 }
physics.addBody( grass, "static", { friction=0.3, shape=grassShape } )

-- Add Scoreboard background
local scorePanel = display.newRect( 0, 0, screenW, 51 )
scorePanel:setFillColor( 0.5 )
scorePanel.anchorX, scorePanel.anchorY = 0, 1
scorePanel.x, scorePanel.y = 0, screenH
	
-- all display objects must be inserted into group
sceneGroup:insert( background )
sceneGroup:insert( grass )
sceneGroup:insert( scorePanel )