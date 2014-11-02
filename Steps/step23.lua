--[[
============================================================
                 STEP 23    
============================================================
 
We are going to remove elements from our level after screen 
is destroyed.                               
	
--]]

--[[
============================================================
                      PART A
============================================================
	
	File we are working with: gameover.lua
	
	locate:	function scene:destroy( event )
	
	Add add code inside the destroy function
============================================================
--]]

-- REMOVE ITEMS FROM GAMEOVER
display.remove( background )
display.remove( scoreboard )
display.remove( playAgainBtn )
display.remove( highScoreText )
display.remove( lastScoreText )
display.remove( lastScoreLabel )	
display.remove( gameOverLabel )
display.remove( highScoreLabel )