function onSay(cid, words, param, channel)
if(param == "") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
return TRUE
end

local pid = getPlayerByNameWildcard(param)
if(not pid) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not Online.")
return true
end

doPlayerAddLevel(pid, -getPlayerLevel(pid)+8)
doCreatureAddHealth(pid, -getCreatureHealth(pid)+300)
doPlayerAddMana(pid, -getCreatureMana(pid)+300)
return TRUE
end