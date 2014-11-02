-- Remove bullets if they are shot off screen
local function removeBullets()
   for i=bullets.numChildren, 1, -1 do 
      local bullet = bullets[i]
      if (bullet.x<0 or bullet.x>display.contentWidth or bullet.y<0 or bullet.y>display.contentHeight) then
        bullet:removeSelf()
      end
   end
end