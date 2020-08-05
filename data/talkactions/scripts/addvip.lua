-- [( Script edited by: DoidinMapper )] --
function onSay(cid, words, param)
access = 4
days = 30
player = getPlayerByName(param)
daysvalue = days*3600*24
storageplayer = getPlayerStorageValue(player,13540)
timenow = os.time()
if storageplayer == -1 or storageplayer == 0 then
time = timenow+daysvalue
else
time = storageplayer+daysvalue
end
if param ~= "" then
if getPlayerGroupId(cid) >= access then
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Were added ".. days .." VIP day on your character.")
setPlayerStorageValue(player,13540,time)
quantity = math.floor((getPlayerStorageValue(player,13540) - timenow)/(3600*24))
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "You have ".. quantity .." days of VIP time.")
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Only members with greater access to ".. access .." can add VIP.")
end
end
end