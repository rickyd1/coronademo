-- Add play again button
-- Function to handle button events

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	-- go to level1.lua scene
	composer.gotoScene( "level1", "fade", 500 )	
	composer.removeScene( "gameover" )
	return true	-- indicates successful touch
end

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