-- [( Script edited by Doidin )] --
function onSay(cid, words, param)

local direction = getCreatureLookDirection(cid)

if direction == NORTH then
doPlayerSendTextMessage(cid, 23, "You are looking to north.")

elseif direction == EAST then
doPlayerSendTextMessage(cid, 23, "You are looking to east.")

elseif direction == SOUTH then
doPlayerSendTextMessage(cid, 23, "You are looking to south.")

elseif direction == WEST then
doPlayerSendTextMessage(cid, 23, "You are looking to west.")
end
return TRUE
end