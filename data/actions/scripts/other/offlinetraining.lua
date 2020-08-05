function onUse(cid, item, fromPosition, itemEx, toPosition)
   if(item.itemid == 1444) then -- sword
     doCreatureSetStorage(cid, 62669, SKILL_SWORD)
   elseif(item.itemid == 10349) then -- axe
     doCreatureSetStorage(cid, 62669, SKILL_AXE)
   elseif(item.itemid == 8834) then -- mlvl
     doCreatureSetStorage(cid, 62669, SKILL__MAGLEVEL)
   elseif(item.itemid == 8626) then -- club
     doCreatureSetStorage(cid, 62669, SKILL_CLUB)
   elseif(item.itemid == 10353) then -- distannce
     doCreatureSetStorage(cid, 62669, SKILL_DISTANCE)
   end
   if item.actionid == 1000 then
   doRemoveCreature(cid)
end
   return true
end
