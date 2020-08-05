function onUse(cid, item, frompos, item2, topos)
 
if  (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
        doPlayerSendCancel(cid, "You Can't Teleport In Battle.")
        doSendMagicEffect(getPlayerPosition(cid), 2)
        else
if  (getCreatureCondition(cid, CONDITION_INFIGHT) == FALSE) then
        doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
        doPlayerSendTextMessage(cid, 4, "Welcome to Temple.")
        doSendMagicEffect(getPlayerPosition(cid), 31)
        end
        end
        end
 
