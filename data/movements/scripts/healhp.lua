function onStepIn(cid, item, position)
if getCreatureHealth(cid) < getCreatureMaxHealth(cid) then
doCreatureAddHealth(cid, getCreatureMaxMana(cid), FALSE)
doSendAnimatedText(getThingPos(cid), "Refilled!", TEXTCOLOR_RED)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Refilled!")
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You are already refilled!")
end
return true
end 