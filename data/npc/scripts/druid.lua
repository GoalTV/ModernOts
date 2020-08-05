local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local druid        = 22017    


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- DRUID START --
function DruidFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,druid)
    if addon == -1 then
        if getPlayerItemCount(cid,5897) >= 50 and getPlayerItemCount(cid,5896) >= 50 then
        if doPlayerRemoveItem(cid,5897,50) and doPlayerRemoveItem(cid,5896,50) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 144, 1)
            doPlayerAddOutfit(cid, 148, 1)
            setPlayerStorageValue(cid,druid,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function DruidSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,druid+1)
    if addon == -1 then
        if getPlayerItemCount(cid,5937) >= 1 and getPlayerItemCount(cid,5938) >= 1 and getPlayerItemCount(cid,5906) >= 100 and getPlayerItemCount(cid,5942) >= 1 and getPlayerItemCount(cid,5940) >= 1 then
        if doPlayerRemoveItem(cid,5937,1) and doPlayerRemoveItem(cid,5938,1) and doPlayerRemoveItem(cid,5906,100) and doPlayerRemoveItem(cid,5942,1) and doPlayerRemoveItem(cid,5940,1) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 144, 2)
            doPlayerAddOutfit(cid, 148, 2)
            setPlayerStorageValue(cid,druid+1,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
-- DRUID END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Druid outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first druid addon' or 'second druid addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})

local node1 = keywordHandler:addKeyword({'first druid addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first druid addon you need to give me 50 wolf paws and 50 bear paws. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, DruidFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second druid addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second druid addon you need to give me Griffinclaw flower sample, water from the hydra cave, 100 demon dusts, a blessed wooden stake and Ceirons wolf tooth chain. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, DruidSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())