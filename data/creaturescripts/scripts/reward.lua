function onAdvance(cid, type, oldlevel, newlevel)

if (oldlevel ~= newlevel and type == SKILL__LEVEL) then

	if (newlevel >= 10 and getPlayerStorageValue(cid, 37340) == -1) then
		if isSorcerer(cid) then
			doPlayerAddItem(cid, 2160, 10)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Recived 10 crystal coins")
			setPlayerStorageValue(cid, 37340, 1)
		end
	end
	
	if (newlevel >= 100 and getPlayerStorageValue(cid, 37341) == -1) then
		if isSorcerer(cid) then
			doPlayerAddItem(cid, 2160, 30)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Recived 30 crystal coins")
			setPlayerStorageValue(cid, 37341, 1)
		end
	end
	
	if (newlevel >= 200 and getPlayerStorageValue(cid, 37342) == -1) then
		if isSorcerer(cid) then
			doPlayerAddItem(cid, 2160, 50)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Recived 50 crystal coins")
			setPlayerStorageValue(cid, 37342, 1)
		end

	end
        if (newlevel >= 300 and getPlayerStorageValue(cid, 37343) == -1) then
		if isSorcerer(cid) then
			doPlayerAddItem(cid, 2160, 50)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Recived 50 crystal coins")
			setPlayerStorageValue(cid, 37343, 1)
		end

	end

       if (newlevel >= 400 and getPlayerStorageValue(cid, 37344) == -1) then
		if isSorcerer(cid) then
			doPlayerAddItem(cid, 2160, 50)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Recived 50 crystal coins")
			setPlayerStorageValue(cid, 37344, 1)
		end

	end

      if (newlevel >= 500 and getPlayerStorageValue(cid, 37345) == -1) then
		if isSorcerer(cid) then
			doPlayerAddItem(cid, 2160, 200)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Recived 200 crystal coins")
			setPlayerStorageValue(cid, 37345, 1)
		end

	end

	
end

return true
end
