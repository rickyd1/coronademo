-- REQUIRE SCORE LIBRARY

-- Include Score library (both level and game over)
local scorer = require ("score")


-- ADD TO GAME OVER FUNCTION
score = totalCandy
saveHighscore (currentLevel, score)


-- ADD current level to create scene

	currentLevel = "main"	
	
	
-- ADD SCORE DATA TO GAMEOVER.LUA

	currentLevel = "main"	
	checkForFile(currentLevel)
	

	printHighScore(currentLevel)
	highScoreText.x, highScoreText.y = halfW + 20, 428
	highScoreText.size = 40
	highScoreText:setTextColor(0, 0, 0)
	
	highScoreLabel = display.newText( "High Score", 0, 0, native.systemFontBold, 24)
	highScoreLabel.x, highScoreLabel.y = halfW - 220, 427
	highScoreLabel.size = 40
	highScoreLabel:setFillColor( 0, 0, 0 )
	highScoreLabel.anchorX = 0
	
	printLastScore(currentLevel)
	lastScoreText.x, lastScoreText.y = halfW + 20, 350
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


