-- Add Game over function

local function gameOver()	
	-- load results
	storyboard.gotoScene( "gameresults", "fade", 500 )
end


-- uncomment from shoot function

timer.performWithDelay( 500, gameOver )