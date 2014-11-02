--Saving/Loading Stuff
ego = require "ego"
saveFile = ego.saveFile
loadFile = ego.loadFile

--Start the score at 0
score = 0

function scoreTime (event)
	score = score - 1
end

--If the file is empty (this means it is the first time you've run the app) save it as 0
function checkForFile (currentLevel)
	-- there shoud be two files one for high score and one for the score of the last game
	
	levelScoreFile = currentLevel.."Score.txt"
	
	-- load last score file
	levelScoreFile = currentLevel.."LastScore.txt"
	
	-- load highscore file
	levelHighScoreFile = currentLevel.."HighScore.txt"
	
	
	highscore = loadFile(levelHighScoreFile)
	lastScore = loadFile(levelScoreFile)
	
	if highscore == "empty" then
		highscore = 0
		saveFile(levelHighScoreFile, highscore)
	end
	
	if lastScore == "empty" then
		lastScore = 0
		saveFile(levelScoreFile, lastScore)
	end
end

function printHighScore(currentLevel)	
	levelHighScoreFile = currentLevel.."HighScore.txt"
	highscore = loadFile(levelHighScoreFile)
	
	-- Display High Score
	highScoreText = display.newText(highscore, 0, 0, native.systemFontBold, 24)
end
function printLastScore(currentLevel)	
	levelScoreFile = currentLevel.."LastScore.txt"
	lastScore = loadFile(levelScoreFile)
	
	-- Display High Score
	lastScoreText = display.newText(lastScore, 0, 0, native.systemFontBold, 24)
end
function saveHighscore (currentLevel, currentScore)
	-- load last score file
	levelScoreFile = currentLevel.."LastScore.txt"
	
	-- load highscore file
	levelHighScoreFile = currentLevel.."HighScore.txt"
	
	highscore = loadFile(levelHighScoreFile)
	
	-- if high score update both files. If not update current score	
	if currentScore > tonumber(highscore) then --We use tonumber as highscore is a string when loaded
		saveFile(levelHighScoreFile, currentScore)
		saveFile(levelScoreFile, currentScore)
	else 		
		saveFile(levelScoreFile, currentScore)
	end
end


