function onLogin(cid)
registerCreatureEvent(cid, "EffectOutLogin")
registerCreatureEvent(cid, "OutfitEffects")
return doCreatureChangeOutfit(cid,{lookType = getCreatureOutfit(cid).lookType, lookHead =  getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet, lookAddons = getCreatureOutfit(cid).lookAddons})
end
local events = {}
function onOutfit(cid, old, current)
local effect = {
[136] = 3, [128] = 3, -- citizen
[270] = 27,[273] = 27, -- jester
[156] = 61,[152] = 61, -- assassin
[147] = 44,[143] = 44, -- barbarian
[148] = 45,[144] = 45, -- druid
[157] = 68,[153] = 68, -- beggar
[149] = 36,[145] = 36, -- wizard
[279] = 17,[278] = 17, -- brotherwood
[137] = 39,[129] = 39, -- hunter
[141] = 66,[133] = 66, -- summoner
[142] = 34,[134] = 34, -- warrior
[155] = 31,[151] = 31, -- pirate
[158] = 46,[154] = 46, -- shaman
[288] = 6,[289] = 6 -- demonhunter
}
                local o,c= effect[old.lookType],effect[current.lookType]
                if getPlayerAccess(cid) > 2 then return true
                elseif (not o or not c or old.lookAddons == 3 and o) then stopEvent(events[getPlayerGUID(cid)]) end
           if current.lookAddons == 3 and c then
                                function WalkEffect(cid, c, pos)
                                if not isCreature(cid) then return LUA_ERROR end
                                if c then frompos = getThingPos(cid)
                                if frompos.x ~= pos.x or frompos.y ~= pos.y or frompos.z ~= pos.z then doSendMagicEffect(frompos, c) end
                                events[getPlayerGUID(cid)] = addEvent(WalkEffect, 100, cid, c, frompos)
                                end return true end
WalkEffect(cid, c, {x=0, y=0, z=0}) end
return true
end