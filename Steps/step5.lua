--[[
============================================================
                 STEP 5                  
============================================================
 
At this stage we are going to update ammo count
                                
============================================================
                 RESOURCES
============================================================

	Not part of the CoronaSDK API

--]]


--[[
============================================================
                      PART A
============================================================
	
	File we are working with: level1.lua
	
	locate: This function will be place just before the before the
	remove bullet function.
		
============================================================
--]]

-- Update ammo count
local function upDateAmmo()	
	myAmmo.text = "Rounds - " .. shotsLeft
	myAmmo.x, myAmmo.y = 10, screenH - 10
end