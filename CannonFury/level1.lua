-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
-- Include Score library
local scorer = require ("score")

-- include Corona's "physics" library
local physics = require "physics"
physics.start(); physics.pause()
physics.setScale( 52 )
--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5

-- Game Over :(

local function gameOver()	
	score = totalCandy
	saveHighscore (currentLevel, score)
	-- load results
	composer.gotoScene( "gameover", "fade", 500 )
end

--Speed up level
local function speedUp()
	graveForce = graveForce - .2
	print(graveForce)
	physics.setGravity( 0, graveForce )
	local gx, gy = physics.getGravity()
	print( "X gravity: " .. gx .. ", Y gravity: " .. gy )
end

-- Update Candy Count
local function updateCandyCount()	
	myCandy.text = "Candy - " .. totalCandy
	myCandy.x, myCandy.y = screenW -200, screenH -10
end
-- Update ammo count
local function upDateAmmo()	
	myAmmo.text = "Rounds - " .. shotsLeft
	myAmmo.x, myAmmo.y = 10, screenH - 10
end
-- Remove bullets if they are shot off screen
local function removeBullets()
   for i=bullets.numChildren, 1, -1 do 
      local bullet = bullets[i]
      if (bullet.x<0 or bullet.x>display.contentWidth or bullet.y<0 or bullet.y>display.contentHeight) then
        bullet:removeSelf()
      end
   end
end
-- Set collision rules
local function onCollision( event )
	if ( event.phase == "began" ) then
 		if event.object1.objectName == "balloon" and event.object2.objectName == "bullet" then 	
			event.object1:removeSelf()	
			audio.play(popSound)				
			-- collect candy
			candyValue = event.object1.candy
			if candyValue ~= nil then
				totalCandy = totalCandy + candyValue
				updateCandyCount()
			end
			if shotsLeft == 0 then
				timer.performWithDelay( 500, gameOver )
			end
		-- Set Collision between gain balloon and bullet
		elseif event.object1.objectName == "gainBalloon" and event.object2.objectName == "bullet" then 	
			event.object1:removeSelf()	
			audio.play(popSound)	
			-- add Shots
			shotsValue = event.object1.shots
			if shotsValue ~= nil then
				shotsLeft = shotsLeft + shotsValue
				upDateAmmo()
			end
		-- Set Collioon between double balloon and bullet
		elseif event.object1.objectName == "doubleBalloon" and event.object2.objectName == "bullet" then 				
			event.object1:removeSelf()	
			audio.play(popSound)	
			-- add Shots
			shotsValue = event.object1.shots
			if shotsValue ~= nil then
				shotsLeft = shotsLeft + shotsValue
				upDateAmmo()
			end				
			-- collect candy
			candyValue = event.object1.candy
			if candyValue ~= nil then
				totalCandy = totalCandy + candyValue
				updateCandyCount()
			end
		-- Set collision with anythin and streamer

		elseif event.object1.objectName == "Streamer" or event.object2.objectName == "Streamer" then 
			if event.object1.objectName ~= "Streamer" then
				event.object1:removeSelf()
			elseif event.object2.objectName ~= "Streamer" then
				event.object2:removeSelf()
			end
 		end		
	elseif ( event.phase == "ended" ) then 
			
	end
end
-- Create shoot functions
local function shoot(event)
		if event.phase == "began" then 
			if shotsLeft >= 1 then
				shotsLeft = shotsLeft - 1
			 	upDateAmmo()
				local bullet = display.newImageRect( "assets/ball.png", 30, 42)			
				bullets:insert( bullet )
				bullet.objectName = "bullet"
				bullet.anchorX, bullet.anchorY = 0, 0
				bullet.x, bullet.y = cannon.x, cannon.y
				physics.addBody(bullet, "dynamic", {density = 8.0, friction = 8.3, bounce = 0, radius =0})				
				bullet:applyLinearImpulse((bullet.x - event.x)*-0.5, (bullet.y - event.y)* -0.5, bullet.x, bullet.y)
				audio.play(fireSound)
			else
				if shotsLeft == 0 then
					-- We will call funciton to end game
					timer.performWithDelay( 500, gameOver )
				end
			end
			
		elseif event.phase == "ended" then 		
		 	-- We will rempove the bullet
			removeBullets()			
		end	
end
local function spawnGainBalloon(event)
	local randomPos = screenW - math.random(screenW - 60)
	-- make a balloon (off-screen), position it, and rotate slightly
	local balloon = display.newImageRect( "assets/green-balloon.png",  60, 71 )
	balloon.x, balloon.y = randomPos, display.contentHeight - 100
	balloons:insert( balloon )
	balloon.rotation = 1
	balloon.shots = 5
	balloon.objectName = "gainBalloon"
	-- add physics to the balloon
	physics.addBody( balloon, { density=3.3, friction=5.3, bounce=.1 } )
	balloon:applyForce( 100, -2400, balloon.x, balloon.y )
end

-- Spawn Double Balloon
local function spawnDoubleBalloon(event)
	local randomPos = screenW - math.random(screenW - 60)
	-- make a balloon (off-screen), position it, and rotate slightly
	local balloon = display.newImageRect( "assets/red-balloon.png", 60, 71 )
	balloon.x, balloon.y = randomPos, display.contentHeight - 100
	balloons:insert( balloon )
	balloon.rotation = 1
	balloon.shots = 5
	balloon.candy = 5
	balloon.objectName = "doubleBalloon"
	-- add physics to the balloon
	physics.addBody( balloon, { density=4.0, friction=1.0, bounce=0.3 } )
	balloon:applyForce( 100, -2400, balloon.x, balloon.y )
end

local function spawnBalloon(event)
	local randomPos = screenW - math.random(screenW - 60)
	-- make a balloon (off-screen), position it, and rotate slightly
	local balloon = display.newImageRect( "assets/black-balloon.png", 60, 71 )
	balloon.x, balloon.y = randomPos, display.contentHeight - 100		
	balloons:insert( balloon )
	balloon.rotation = 1
	balloon.candy = 3
	balloon.objectName = "balloon"
	-- add physics to the balloon
	physics.addBody( balloon, { density=4.0, friction=0.8, bounce=1.3 } )
	balloon:applyForce( 400, -2400, balloon.x, balloon.y )
end

function scene:create( event )
	local sceneGroup = self.view
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- define current level 
	currentLevel = "main"	
	-- create groups for balloons and bullets
	bullets = display.newGroup()
 	balloons = display.newGroup()
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

	-- Add Scoreboard background
	local scorePanel = display.newRect( 0, 0, screenW, 51 )
	scorePanel:setFillColor( 0.5 )
	scorePanel.anchorX, scorePanel.anchorY = 0, 1
	scorePanel.x, scorePanel.y = 0, screenH

	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( grass )
	sceneGroup:insert( scorePanel )
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		-- create a cannon
		cannon = display.newImageRect("assets/d-canon.png", 41, 58 )
		cannon.anchorX = 0.5
		cannon.anchorY = 1
		cannon.x, cannon.y = display.contentWidth * .5, display.contentHeight - 70
		
		
		sceneGroup:insert( cannon )
		
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.	
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
			
			-- Add Shoot Feature To load Screen
			Runtime:addEventListener("touch", shoot)
			-- Add Balloon spawn timer
			blackBalloons = timer.performWithDelay(1000, spawnBalloon, 0)
			gainBalloons = timer.performWithDelay(8000, spawnGainBalloon, 60)
			doubleBalloons = timer.performWithDelay(15000, spawnDoubleBalloon, 30)		
			-- Listen for ball balloon collision
			Runtime:addEventListener( "collision", onCollision )
			-- Make level harder		
			leveUp = timer.performWithDelay(4000, speedUp, 100)
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
		Runtime:removeEventListener("touch", shoot)
		timer.cancel(blackBalloons)	
		timer.cancel(gainBalloons)
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
		display.remove( cannon )		
		display.remove( scorePanel )

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
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene