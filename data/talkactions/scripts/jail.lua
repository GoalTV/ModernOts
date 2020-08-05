local jpos = { 
    [1] = {x = 635, y = 1017, z =7},
    [2] = {x = 639, y = 1017, z =7},
    [3] = {x = 643, y = 1017, z =7},
    [4] = {x = 647, y = 1017, z =7},
    [5] = {x = 651, y = 1017, z =7},
    [6] = {x = 665, y = 1017, z =7},
    [7] = {x = 659, y = 1018, z =7},
    [8] = {x = 659, y = 1024, z =7},
    [9] = {x = 659, y = 1017, z =7},
    [10] = {x = 656, y = 1025, z =7},
    [11] = {x = 652, y = 1025, z =7},
    [12] = {x = 648, y = 1025, z =7},
    [13] = {x = 644, y = 1025, z =7},
    [14] = {x = 640, y = 1025, z =7},
    [15] = {x = 636, y = 1025, z =7}
}
function onSay ( cid, words, param )
local rand = math.random(#jpos)
grouprequired = 4
jailedstoragevalue = 1338
unjailpos = { x = 1000, y = 1000, z = 7 } 
if words == '/jail' then 
if getPlayerGroupId ( cid ) >= grouprequired and param ~= "" and getPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue ) == -1 then 
jailer = getPlayerName ( cid ) 
doTeleportThing ( getPlayerByName ( param )
, jpos[rand], true)
doPlayerSendTextMessage ( getPlayerByName ( param ), 25, 'You have been jalied by '..jailer..'' ) 
doPlayerSendTextMessage ( cid, 21, "You just jailed "..param.."." )
setPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue, 1 )
elseif getPlayerGroupId ( cid ) < grouprequired then
doPlayerSendTextMessage ( cid, 21, "You don't have access to unjail other players." )
elseif getPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue ) ~= -1 then
doPlayerSendTextMessage ( cid, 21, "This Player is already jailed." ) 
else
doPlayerSendTextMessage ( cid, 21, "You need to fill in a playername!" )
end
elseif words == '/unjail' then
if getPlayerGroupId ( cid ) >= grouprequired and param ~= "" and getPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue ) == 1 then 
unjailer = getPlayerName ( cid )
doTeleportThing ( getPlayerByName ( param ), unjailpos, 0 )
doPlayerSendTextMessage ( getPlayerByName ( param ), 25, 'You have been unjailed by '..unjailer..'' )
doPlayerSendTextMessage ( cid, 21,"You just unjailed "..param.."." )
setPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue, -1 )

elseif getPlayerGroupId ( cid ) < 4 then
doPlayerSendTextMessage ( cid, 21, "You cannot unjail someone!" )
elseif getPlayerStorageValue ( getPlayerByName ( param ), jailedstoragevalue ) ~= 1 then
doPlayerSendTextMessage ( cid, 21, "This Player is already unjailed." )
else
doPlayerSendTextMessage ( cid, 21, "You need to fill in a playername!" )
end 
end 
end
	
	
	