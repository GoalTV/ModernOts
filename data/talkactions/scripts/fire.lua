local config = {
cost = 500000,
idsoft = 9932,
idwornsoft = 10022
}
function onSay(cid, words, param)
local pos = getCreaturePosition(cid)
if getPlayerItemCount(cid, config.idwornsoft) >= 1 then
if getPlayerMoney(cid) >= config.cost then
doPlayerBuyItem(cid, config.idsoft, 1, config.cost, 1)
doPlayerRemoveItem(cid, config.idwornsoft, 1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your Firewalkery have been Charged.")
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you don't have enought money!")
end
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you don't have enought money!")
end
return TRUE
end
