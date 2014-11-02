--[[
============================================================
                 STEP FOUR                  
============================================================
 
At this stage we are going to remove bullets that are off screen
                                
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
	
	locate: --	removeBullets()
	
	You will need to uncomment this function. It is location in the shoot function within: 
		
		elseif event.phase == "ended" then 	
		
============================================================
--]]



--[[
============================================================
                      PART B
============================================================
	
	File we are working with: level1.lua
	
	locate: This function will be place just before the shoot() function	
		
============================================================
--]]


-- Remove bullets if they are shot off screen
local function removeBullets()
   for i=bullets.numChildren, 1, -1 do 
      local bullet = bullets[i]
      if (bullet.x<0 or bullet.x>display.contentWidth or bullet.y<0 or bullet.y>display.contentHeight) then
        bullet:removeSelf()
      end
   end
end