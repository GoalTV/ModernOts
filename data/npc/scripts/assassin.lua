local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local assassin    = 22025  


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- ASSASSIN START --
function AssassinFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,assassin)
    if addon == -1 then
        if getPlayerItemCount(cid,5898) >= 30 and getPlayerItemCount(cid,5882) >= 10 and getPlayerItemCount(cid,5881) >= 30 and getPlayerItemCount(cid,5895) >= 20 and getPlayerItemCount(cid,5905) >= 20 and getPlayerItemCount(cid,5906) >= 10 and getPlayerItemCount(cid,5885) >= 1 then
        if doPlayerRemoveItem(cid,5898,30) and doPlayerRemoveItem(cid,5882,10) and doPlayerRemoveItem(cid,5881,30) and doPlayerRemoveItem(cid,5895,20) and doPlayerRemoveItem(cid,5905,20) and doPlayerRemoveItem(cid,5906,10) and doPlayerRemoveItem(cid,5885,1) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 152, 1)
            doPlayerAddOutfit(cid, 156, 1)
            setPlayerStorageValue(cid,assassin,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function AssassinSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,assassin+1)
    if addon == -1 then
        if getPlayerItemCount(cid,5909) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5912) >= 50 and getPlayerItemCount(cid,5913) >= 50 and getPlayerItemCount(cid,5914) >= 50 and getPlayerItemCount(cid,5886) >= 10 then
        if doPlayerRemoveItem(cid,5909,50) and doPlayerRemoveItem(cid,5910,50) and doPlayerRemoveItem(cid,5911,50) and doPlayerRemoveItem(cid,5912,50) and doPlayerRemoveItem(cid,5913,50) and doPlayerRemoveItem(cid,5914,50) and doPlayerRemoveItem(cid,5886,10) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 152, 2)
            doPlayerAddOutfit(cid, 156, 2)
            setPlayerStorageValue(cid,assassin+1,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
-- ASSASSIN END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Assassin outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first assassin addon' or 'second assassin addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})


local node1 = keywordHandler:addKeyword({'first assassin addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first assassin addon you need to give me 30 beholder eyes, 10 red dragon scales, 30 lizard scales, 20 fish fins, 20 vampire dusts, 10 demon dusts and Warrior\'s sweat. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, AssassinFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second assassin addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second assassin addon you need to give me 50 blue piece of cloth, 50 green piece of cloth, 50 red piece of cloth, 50 brown piece of cloth, 50 yellow piece of cloth, 50 white piece of cloth and 10 spider silk yarns. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, AssassinSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())