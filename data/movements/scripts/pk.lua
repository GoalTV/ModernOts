function onStepIn(cid, item, pos)
doCreatureSay(cid, "Lets PK!", TALKTYPE_YELL)
doSendMagicEffect(pos, CONST_ME_NONE)
return true
end