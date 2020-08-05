function onThink(interval, lastExecution)
for _, name in ipairs(getOnlinePlayers()) do
local cid = getPlayerByName(name)
if not isPlayerGhost(cid) and getPlayerStorageValue(cid, 13540) >= 1 and getPlayerGroupId(cid) <=3 then
doSendMagicEffect(getPlayerPosition(cid), 66)
doSendAnimatedText(getPlayerPosition(cid), "[VIP]", TEXTCOLOR_RED)
end
end
return true
end
