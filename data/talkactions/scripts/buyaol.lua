function onSay(cid, words, param)
if doPlayerRemoveMoney(cid,20000) then
    doPlayerAddItem(cid,2173,1)
    doSendMagicEffect(getPlayerPosition(cid),12)
    doPlayerSendTextMessage(cid,22,"You\'ve bought an Aol!")
else
    doPlayerSendCancel(cid,"You don\'t have enough money.")
    doSendMagicEffect(getPlayerPosition(cid),2)
end
return TRUE
end