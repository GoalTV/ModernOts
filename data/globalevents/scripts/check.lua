 function onThink(pid, interval)
local t = {x=1000, y=1000, z=7} 
        for _, pid in ipairs(getPlayersOnline()) do
                if getPlayerStorageValue(pid,23331) == 1 then
				
                        if getPlayerSoul(pid) > 5 then
                                doPlayerAddSoul(pid, -1)
                        else
                             setPlayerStorageValue(pid, 23331, -1)
					doTeleportThing(pid, t)
				doCreatureSay(pid, "You have no enought Soul Points to Train. Come back with more than 6 Soul Points.", TALKTYPE_ORANGE_1)							 
                        end
                end

        end
return true
end 