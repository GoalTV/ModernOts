local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local wizard        = 22019    


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- WIZARD START --
function WizardFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,wizard)
    if addon == -1 then
        if getPlayerItemCount(cid,2488) >= 1 and getPlayerItemCount(cid,2123) >= 1 and getPlayerItemCount(cid,2492) >= 1 and getPlayerItemCount(cid,2536) >= 1 then
        if doPlayerRemoveItem(cid,2488,1) and doPlayerRemoveItem(cid,2123,1) and doPlayerRemoveItem(cid,2492,1) and doPlayerRemoveItem(cid,2536,1) then
            selfSay(newaddon)
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 145, 2)
            doPlayerAddOutfit(cid, 149, 2)
            setPlayerStorageValue(cid,wizard,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function WizardSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,wizard+1)
    if addon == -1 then
        if getPlayerItemCount(cid,5922) >= 50 and getPlayerStorageValue(cid,wizard) then
        if doPlayerRemoveItem(cid,5922,50) and getPlayerStorageValue(cid,wizard) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 145, 1)
            doPlayerAddOutfit(cid, 149, 1)
            setPlayerStorageValue(cid,wizard+1,1)
        end
        else
            selfSay(noitems2)
        end
    else
        selfSay(already)
    end
    end

end
-- WIZARD END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Wizard outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first wizard addon' or 'second wizard addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})

local node1 = keywordHandler:addKeyword({'first wizard addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first wizard addon you need to give me a dragon scale mail, a pair of crown legs, a medusa shield and a ring of the sky. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, WizardFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second wizard addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second wizard addon you need to give me 50 holy orchids. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, WizardSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())