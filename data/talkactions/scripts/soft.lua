local config = {
    cost = 10000, -- Ile kosztuje naprawienie softow
    idsoft = 2640, -- ID softow
    idwornsoft = 10021 -- ID zepsutych softow    
    }
function onSay(cid, words, param)
local pos = getCreaturePosition(cid)
if getPlayerItemCount(cid, config.idwornsoft) >= 1 then
if getPlayerMoney(cid) >= config.cost then
doPlayerBuyItem(cid, config.idsoft, 1, config.cost, 1)
doPlayerRemoveItem(cid, config.idwornsoft, 1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your Soft have been Charged.")
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you don't have enought money!")
end
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you don't have Worn Soft Boots!")
end
return TRUE
end
