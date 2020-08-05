function onCastSpell(cid, var)
if isPlayer(getCreatureTarget(cid)) then
local amount = 250
doPlayerAddMana(getCreatureTarget(cid), amount)
end
return true
end
