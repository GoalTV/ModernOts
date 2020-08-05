local price = 100 --- 
local duration = 18000
local monsters = {"orc warrior", "pirate cutthroat", "dworc voodoomaster", "dwarf guard", "minotaur mage"}


function onUse(cid, item, fromPosition, itemEx, toPosition)
doSetMonsterOutfit(cid,monsters[math.random(#monsters)],duration*1000)
doPlayerSendTextMessage(cid, 20, 'You got a random outfit!')
if getPlayerMoney (cid) >= price and getPlayerVipDays(cid) < 1 then 
doPlayerRemoveMoney(cid, price) 
doSetMonsterOutfit(cid,monsters[math.random(#monsters)],duration*1000)
doPlayerSendTextMessage(cid, 20, 'You got a random outfit for '.. price ..' gold coins!') 
else
doPlayerSendTextMessage(cid, 20, 'You don\'t have '..price..' gold coinds required for the random outfit!')
end 
return true
end