-- Update ammo count
local function upDateAmmo()	
	myAmmo.text = "Rounds - " .. shotsLeft
	myAmmo.x, myAmmo.y = 10, screenH - 10
end