-- Set Collision between gain balloon and bullet
elseif event.object1.objectName == "gainBalloon" and event.object2.objectName == "bullet" then 	
	event.object1:removeSelf()	
	-- add Shots
	shotsValue = event.object1.shots
	if shotsValue ~= nil then
		shotsLeft = shotsLeft + shotsValue
		upDateAmmo()
	end