function onSay(cid, words, param)
if getPlayerMoney(cid) >= 10000 then
    doPlayerRemoveMoney(cid,10000)
    doPlayerAddItem(cid,2173,1)
    doSendMagicEffect(getPlayerPosition(cid),12)
    doPlayerSendTextMessage(cid,22,"You bought an AOL!")
else
    doPlayerSendCancel(cid,"Ya ain't got enough money.")
    doSendMagicEffect(getPlayerPosition(cid),2)
end
return TRUE
end