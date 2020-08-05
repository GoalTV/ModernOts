function onLogin (cid)
playerpos = getPlayerPosition(cid)
doSendAnimatedText(playerpos, "Welcome!", TEXTCOLOR_BLUE)
doSendMagicEffect(playerpos, 36)
return TRUE
end