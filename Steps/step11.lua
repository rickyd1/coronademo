-- Set Collioon between double balloon and bullet
elseif event.object1.objectName == "doubleBalloon" and event.object2.objectName == "bullet" then 				
	event.object1:removeSelf()	
	-- add Shots
	shotsValue = event.object1.shots
	if shotsValue ~= nil then
		shotsLeft = shotsLeft + shotsValue
		upDateAmmo()
	end				
	-- collect candy
	candyValue = event.object1.candy
	if candyValue ~= nil then
		totalCandy = totalCandy + candyValue
		updateCandyCount()
	end