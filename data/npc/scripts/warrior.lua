local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local warrior        = 22013    


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- WARRIOR START --
function WarriorFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,warrior)
    if addon == -1 then
        if getPlayerItemCount(cid,5925) >= 100 and getPlayerItemCount(cid,5899) >= 100 and getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5919) >= 1 then
        if doPlayerRemoveItem(cid,5925,100) and doPlayerRemoveItem(cid,5899,100) and doPlayerRemoveItem(cid,5884,1) and doPlayerRemoveItem(cid,5919,1) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 134, 1)
            doPlayerAddOutfit(cid, 142, 1)
            setPlayerStorageValue(cid,warrior,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function WarriorSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,warrior+1)
    if addon == -1 then
        if getPlayerItemCount(cid,5887) >= 1 and getPlayerItemCount(cid,5880) >= 100 then
        if doPlayerRemoveItem(cid,5887,1) and doPlayerRemoveItem(cid,5880,100) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 134, 2)
            doPlayerAddOutfit(cid, 142, 2)
            setPlayerStorageValue(cid,warrior+1,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
-- WARRIOR END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Warrior outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first warrior addon' or 'second warrior addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})

local node1 = keywordHandler:addKeyword({'first warrior addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first warrior addon you need to give me 100 hardened bones, 100 turtle shells, a fighting spirit and a dragon claw. Do you have it with you?'})
    node1:addChildKeyword({'yes'}, WarriorFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second warrior addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second warrior addon you need to give me 100 iron ores and a piece of royal steel. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, WarriorSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())