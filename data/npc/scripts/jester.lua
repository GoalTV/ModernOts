local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local jester        = 22035


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- JESTER START --
function JesterFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,jester)
    if addon == -1 then
        if getPlayerItemCount(cid,5879) >= 1 and getPlayerItemCount(cid,5878) >= 1 then
        if doPlayerRemoveItem(cid,5879,1) and doPlayerRemoveItem(cid,5878,1) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 273, 1)
            doPlayerAddOutfit(cid, 270, 1)
            setPlayerStorageValue(cid,jester,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function JesterSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,jester+1)
    if addon == -1 then
        if getPlayerItemCount(cid,5909) >= 5 then
        if doPlayerRemoveItem(cid,5909,5) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 273, 2)
            doPlayerAddOutfit(cid, 270, 2)
            setPlayerStorageValue(cid,jester+1,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
-- JESTER END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Jester outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first jester addon' or 'second jester addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})

local node1 = keywordHandler:addKeyword({'first jester addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first jester addon you need to give me a giant spider silk and 4 minotaur leathers. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, JesterFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second jester addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second jester addon you need to give me 5 white piece of cloth. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, JesterSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())