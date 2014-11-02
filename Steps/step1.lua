-- SET SCALE 
physics.setScale( 52 )

-- CREATE SCENE ELEMENTS
	

-- create a rectangle as the backdrop
local background = display.newRect( 0, 0, screenW, screenH )
background.anchorX = 0
background.anchorY = 0
local gradient = {
    type="gradient",
    color1={ 105/255, 164/255, 192/255 }, color2={ 4/255, 64/255, 92/255 }, direction="down"
}
background:setFillColor( gradient )

-- create a cannon
cannon = display.newImageRect("assets/d-canon.png", 41, 58 )
cannon.anchorX = 0.5
cannon.anchorY = 1
cannon.x, cannon.y = display.contentWidth * .5, display.contentHeight - 70

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
sceneGroup:insert( cannon )
sceneGroup:insert( grass )
sceneGroup:insert( scorePanel )