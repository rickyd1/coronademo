-- Set collision with anythin and streamer

elseif event.object1.objectName == "Streamer" or event.object2.objectName == "Streamer" then 
	if event.object1.objectName ~= "Streamer" then
		event.object1:removeSelf()
	elseif event.object2.objectName ~= "Streamer" then
		event.object2:removeSelf()
	end