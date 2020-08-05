local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local pirate        = 22023    


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- PIRATE START --
function PirateFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,pirate)
    if addon == -1 then
        if getPlayerItemCount(cid,6126) >= 100 and getPlayerItemCount(cid,6097) >= 100 and getPlayerItemCount(cid,6098) >= 100 then
        if doPlayerRemoveItem(cid,6126,100) and doPlayerRemoveItem(cid,6097,100) and doPlayerRemoveItem(cid,6098,100) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 151, 1)
            doPlayerAddOutfit(cid, 155, 1)
            setPlayerStorageValue(cid,pirate,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function PirateSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,pirate+1)
    if addon == -1 then
        if getPlayerItemCount(cid,2385) >= 1 and getPlayerItemCount(cid,6098) >= 1 and getPlayerItemCount(cid,6095) >= 1 and getPlayerItemCount(cid,6096) >= 1 then
        if doPlayerRemoveItem(cid,6099,1) and doPlayerRemoveItem(cid,6100,1) and doPlayerRemoveItem(cid,6101,1) and doPlayerRemoveItem(cid,6102,1) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 151, 2)
            doPlayerAddOutfit(cid, 155, 2)
            setPlayerStorageValue(cid,pirate+1,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
-- PIRATE END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Pirate outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first pirate addon' or 'second pirate addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})

local node1 = keywordHandler:addKeyword({'first pirate addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first pirate addon you need to give me 100 hooks, 100 peg legs and 100 eye patches. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, PirateFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second pirate addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second pirate addon you need to give me brutus bloodbeard\'s hat, lethal lissy\'s shirt, ron the ripper\'s sabre and deadeye devious\' eye patch. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, PirateSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())