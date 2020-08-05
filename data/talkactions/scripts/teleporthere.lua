function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
return TRUE
end
local target = getPlayerByNameWildcard(param)
if(not target) then
target = getCreatureByName(param)
if(not target) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Creature not found.")
return TRUE
end
end
if(isPlayerGhost(target) and getPlayerGhostAccess(target) > getPlayerGhostAccess(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Creature not found.")
return TRUE
end
local pos = getClosestFreeTile(target, getCreaturePosition(cid), false, false)
if(not pos or isInArray({pos.x, pos.y}, 0)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cannot perform action.")
return TRUE
end
local tmp = getCreaturePosition(target)
if(doTeleportThing(target, pos, TRUE) and not isPlayerGhost(target)) then
doSendMagicEffect(tmp, CONST_ME_POFF)
doSendMagicEffect(pos, CONST_ME_TELEPORT)
end
return TRUE
end
