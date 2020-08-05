function onStepIn(cid, item, position, fromPosition)
	if getPlayerSoul(cid) < 6 then
		doTeleportThing(cid, fromPosition, true)
		doCreatureSay(cid, "You have no enought Soul Points, go hunt to get them.", TALKTYPE_ORANGE_1)	
	end
	return true
end
