function onUse(cid, item, fromPosition, itemEx, toPosition)
   	if item.uid == 7771 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found an Yalahari Mask")
   			doPlayerAddItem(cid,8890,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 7772 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found an Yalahari Armor")
   			doPlayerAddItem(cid,8918,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 7773 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found an Yalahari Leg Piece")
   			doPlayerAddItem(cid,8881,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
		end
   	elseif item.uid == 1303 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Master Archer's Armor.")
   			doPlayerAddItem(cid,8888,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
  	elseif item.uid == 1304 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found an Earthborn titan armor.")
   			doPlayerAddItem(cid,8882,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 1305 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Windborn colossus armor.")
   			doPlayerAddItem(cid,8883,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 1306 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Obsidian Truncheon.")
   			doPlayerAddItem(cid,8928,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 1307 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Emerald Sword.")
   			doPlayerAddItem(cid,8930,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 1308 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Warsinger Bow.")
   			doPlayerAddItem(cid,8854,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	end
   	return 1
end
