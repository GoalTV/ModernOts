local condition = createConditionObject(CONDITION_INFIGHT)
setConditionParam(condition, CONDITION_PARAM_TICKS, 60000)
function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerAccess(cid) < 5 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have no access to use this hammer!")
return false
end

if not isPlayer(itemEx.uid) or cid == itemEx.uid then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You can only use this hammer on players!")
return false
else
doAddCondition(itemEx.uid, condition)
doCreatureSetSkullType(itemEx.uid, 5)
doCreatureSetNoMove(itemEx.uid, 1)
doSendMagicEffect(getPlayerPosition(itemEx.uid), CONST_ME_MAGIC_RED)
end
return true
end