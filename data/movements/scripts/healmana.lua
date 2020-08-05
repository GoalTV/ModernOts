function onStepIn(cid, item, position)
if getCreatureMana(cid) < getCreatureMaxMana(cid) then
doCreatureAddMana(cid, getCreatureMaxMana(cid), FALSE)
doSendAnimatedText(getThingPos(cid), "Refilled!", TEXTCOLOR_BLUE)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Refilled!")
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You are already refilled!")
end
return true
end 