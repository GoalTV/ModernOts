local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local oriental    = 22021    


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- ORIENTAL START --
function OrientalFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,oriental)
    if addon == -1 then
        if getPlayerItemCount(cid,5945) >= 1 then
        if doPlayerRemoveItem(cid,5945,1) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 146, 1)
            doPlayerAddOutfit(cid, 150, 1)
            setPlayerStorageValue(cid,oriental,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function OrientalSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,oriental+1)
    if addon == -1 then
        if getPlayerItemCount(cid,5883) >= 100 and getPlayerItemCount(cid,5895) >= 100 and getPlayerItemCount(cid,5891) >= 2 and getPlayerItemCount(cid,5912) >= 100 then
        if doPlayerRemoveItem(cid,5883,100) and doPlayerRemoveItem(cid,5895,100) and doPlayerRemoveItem(cid,5891,2) and doPlayerRemoveItem(cid,5912,100) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 146, 2)
            doPlayerAddOutfit(cid, 150, 2)
            setPlayerStorageValue(cid,oriental+1,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
-- ORIENTAL END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Oriental outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first oriental addon' or 'second oriental addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})

local node1 = keywordHandler:addKeyword({'first oriental addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first oriental addon you need to give me a mermaid comb. Do you have it with you?'})
    node1:addChildKeyword({'yes'}, OrientalFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second oriental addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second oriental addon you need to give me 100 ape furs, 100 fish fins, 2 enchanted chicken wings and 100 blue pieces of cloth. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, OrientalSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})
npcHandler:addModule(FocusModule:new())