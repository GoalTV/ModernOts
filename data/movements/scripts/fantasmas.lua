function onStepIn(cid, item, pos)
doCreatureSay(cid, "ModernOts GO GO!", TALKTYPE_YELL)
doSendMagicEffect(pos, CONST_ME_NONE)
return true
end