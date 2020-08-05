function onUse(cid, item, fromPosition, itemEx, toPosition)

local config = {
newExp = 3, -- exp * 2 / double exp // 3 = 3x exp
value = 8765, -- don't touch
text = "Now you get double exp.", -- text on use item
text_havealready = "You already get double exp."
}

if getPlayerStorageValue(cid,config.value) == FALSE then
setPlayerStorageValue(cid,config.value,1)
setPlayerExtraExpRate(cid,config.newExp)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, config.text_havealready)
end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, config.text)
return TRUE
end 