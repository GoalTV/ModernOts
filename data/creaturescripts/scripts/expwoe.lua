dofile("./_woe.lua")

function onLogin(cid)
	Woe.getInfo()
	local Guild_ID = getPlayerGuildId(cid)
	if (Guild_ID == infoLua[2]) and (infoLua[2] ~= 0) then
		doPlayerSetExperienceRate(cid, 1.20)	-- here 
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Your guild has won the last War of Emperium, for that reason you have 20% extra experience.")
	end
	return true
end