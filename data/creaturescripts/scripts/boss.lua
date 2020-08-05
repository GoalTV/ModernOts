local first_level = "Death"
local second_level = "Mlody Boss"
local rebirthEffect = CONST_ME_FLAM

function onDeath(cid, lastHitKiller, mostDamageKiller)
if getCreatureName(first_level) == true then
doSendMagicEffect(getCreaturePostion(cid, rebirthEffect))
doCreateCreature(second_level, getCreaturePosition(cid))
doCreatureSay(second_level, "CRAW!", RED)
end
return true
end
