--[[
============================================================
                 STEP 17             
============================================================
 
We are going to add display object to our gameover screen
                                
============================================================
                 RESOURCES
============================================================
	
	widget.newButton():

	http://docs.coronalabs.com/api/library/widget/newButton.html

--]]

--[[
============================================================
                      PART A
============================================================
	
	File we are working with: gameover.lua
	
	locate:	scene:create( event )
	
	Place funciton prior to scene create function
		
============================================================
--]]


-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	-- go to level1.lua scene
	composer.gotoScene( "level1", "fade", 500 )	
	composer.removeScene( "gameover" )
	return true	-- indicates successful touch
end


--[[
============================================================
                      PART B
============================================================
	
	File we are working with: level1.lua
	
	locate:	scene:show( event )
					if phase == "will" then
					
	Place function with the will conditional of the scene show function
		
============================================================
--]]
-- Add to show scene
	
	playAgainBtn = widget.newButton{
		label="Play Again",
		labelColor = { default={0}, over={0} },
		emboss = false,
	  --properties for a rounded rectangle button...
	  shape="roundedRect",
		fillColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
		font = native.systemFontBold,
		fontSize = 40,
		width=340, height=82,
		onRelease = onPlayBtnRelease
	}


	playAgainBtn.anchorX, playAgainBtn.anchorY = 0.5, 0.5
	playAgainBtn.x, playAgainBtn.y = halfW, 600

	sceneGroup:insert( playAgainBtn )