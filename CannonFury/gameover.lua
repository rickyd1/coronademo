-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local scorer = require ("score")

-- include Corona's "widget" library
local widget = require "widget"

-- include Corona's "physics" library
local physics = require "physics"
physics.start(); physics.pause()

--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	-- go to level1.lua scene
	composer.gotoScene( "level1", "fade", 500 )
	composer.removeScene( "gameover" )
	return true	-- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
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
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( scoreboard )
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		
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
		
		currentLevel = "main"	
		checkForFile(currentLevel)


		printHighScore(currentLevel)
		highScoreText.x, highScoreText.y = halfW + 80, 428
		highScoreText.size = 40
		highScoreText:setTextColor(0, 0, 0)
		
		highScoreLabel = display.newText( "High Score", 0, 0, native.systemFontBold, 24)
		highScoreLabel.x, highScoreLabel.y = halfW - 220, 427
		highScoreLabel.size = 40
		highScoreLabel:setFillColor( 0, 0, 0 )
		highScoreLabel.anchorX = 0
		
		
		printLastScore(currentLevel)
		lastScoreText.x, lastScoreText.y = halfW + 80, 350
		lastScoreText.size = 40
		lastScoreText:setTextColor(0, 0, 0)
		
		lastScoreLabel = display.newText( "Your Score", 0, 0, native.systemFontBold, 24)
		lastScoreLabel.x, lastScoreLabel.y = halfW - 220, 350
		lastScoreLabel.size = 40
		lastScoreLabel:setFillColor( 0, 0, 0 )
		lastScoreLabel.anchorX = 0
		
		gameOverLabel = display.newText( "Game Over", 0, 0, native.systemFontBold, 24)
		gameOverLabel.x, gameOverLabel.y = halfW - 220, 200
		gameOverLabel.size = 80
		gameOverLabel:setFillColor( 0, 0, 0 )
		gameOverLabel.anchorX = 0



		sceneGroup:insert( highScoreText )
		sceneGroup:insert( highScoreLabel )
		sceneGroup:insert( lastScoreText )
		sceneGroup:insert( lastScoreLabel )	
		sceneGroup:insert( gameOverLabel )	
		sceneGroup:insert( playAgainBtn )
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.	
		-- LOAD ELEMENTS AFTER USER IS ON SCREEN
		
		



	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen

	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	package.loaded[physics] = nil
	physics = nil
	display.remove( background )
	display.remove( scoreboard )
	display.remove( playAgainBtn )
	display.remove( highScoreText )
	display.remove( lastScoreText )
	display.remove( lastScoreLabel )	
	display.remove( gameOverLabel )
	display.remove( highScoreLabel )
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene