function changeSkull(cid)
local position = getCreaturePosition(cid)
if (not isPlayer(cid)) then
return true
end
if (getCreatureSkullType(cid) < 4) then
doCreatureSetSkullType(cid, (getCreatureSkullType(cid)+1))
else
doCreatureSetSkullType(cid, 1)
end
addEvent(changeSkull, 200, cid)
return true
end

function crazy(cid)
local position = getCreaturePosition(cid)
local outfit = {
lookType = math.random(137,160),
lookHead = math.random(1,130),
lookBody = math.random(1,130),
lookLegs = math.random(1,130),
lookFeet = math.random(1,130),
lookAddons = 3
} 
doSendDistanceShoot(getCreaturePosition(cid), {x = position.x + math.random(-7, 7), y = position.y + math.random(-5, 5), z = position.z}, math.random(1,41)) 
doSendMagicEffect({x = position.x + math.random(-7, 7), y = position.y + math.random(-5, 5), z = position.z}, math.random(1,32))
doCreatureChangeOutfit(cid, outfit)
doCreatureSetLookDirection(cid, math.random(1,8))
doCreatureSetSpeakType(cid, 19)
doSetCreatureLight(cid, math.random(1,200), math.random(1,10), 1000)
addEvent(crazy, 200, cid)
return true
end

function onSay(cid, words, param, channel)
local time = 1
local storage = 100
local outfit = {
lookType = 128,
lookHead = math.random(1,130),
lookBody = math.random(1,130),
lookLegs = math.random(1,130),
lookFeet = math.random(1,130),
lookAddons = 0
} 
if param == "on" and getPlayerStorageValue(cid, storage) == -1 then 
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Its Crazy Time.")
addEvent(changeSkull, time * 200, cid)
addEvent(crazy, time * 200, cid)
setPlayerStorageValue(cid, storage, 1) 
elseif param == "off" then
doCreatureChangeOutfit(cid, outfit)
setPlayerStorageValue(cid, storage, -1)
addEvent(doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"GoodBye"), 4000, cid) 
addEvent(doRemoveCreature, time * 2000, cid) 
end 
return true
end