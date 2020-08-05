local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local mage        = 22005


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- MAGE START --
function MageFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,mage)
    if addon == -1 then
        if getPlayerSex(cid) == 0 then
        if getPlayerItemCount(cid,5958) >= 1 then
        if doPlayerRemoveItem(cid,5958,1) then
            selfSay(newaddon)
                 
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 141, 1)
            doPlayerAddOutfit(cid, 130, 1)
            setPlayerStorageValue(cid,mage,1)
        end
        else
            selfSay(noitems)
        end
        elseif getPlayerSex(cid) == 1 then
        if getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then
        if doPlayerRemoveItem(cid,2181,1) and doPlayerRemoveItem(cid,2182,1) and doPlayerRemoveItem(cid,2183,1) and doPlayerRemoveItem(cid,2185,1) and doPlayerRemoveItem(cid,2186,1) and doPlayerRemoveItem(cid,2187,1) and doPlayerRemoveItem(cid,2188,1) and doPlayerRemoveItem(cid,2189,1) and doPlayerRemoveItem(cid,2190,1) and doPlayerRemoveItem(cid,2191,1) and doPlayerRemoveItem(cid,5904,10) and doPlayerRemoveItem(cid,2193,20) and doPlayerRemoveItem(cid,5809,1) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 130, 1)
            doPlayerAddOutfit(cid, 141, 1)
            setPlayerStorageValue(cid,mage,1)
        end
        else
            selfSay(noitems)
        end
        end
    else
        selfSay(already)
    end
    end

end

function MageSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,mage+1)
    if addon == -1 then
        if getPlayerSex(cid) == 0 then
        if getPlayerItemCount(cid,5894) >= 70 and getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then
        if doPlayerRemoveItem(cid,5894,70) and doPlayerRemoveItem(cid,5911,20) and doPlayerRemoveItem(cid,5883,40) and doPlayerRemoveItem(cid,5922,35) and doPlayerRemoveItem(cid,5886,10) and doPlayerRemoveItem(cid,5881,60) and doPlayerRemoveItem(cid,5882,40) and doPlayerRemoveItem(cid,5904,15) and doPlayerRemoveItem(cid,5905,30) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 141, 2)
            doPlayerAddOutfit(cid, 130, 2)
            setPlayerStorageValue(cid,mage+1,1)
        end
        else
            selfSay(noitems)
        end
        elseif getPlayerSex(cid) == 1 then
        if getPlayerItemCount(cid,5903) >= 1 then
        if doPlayerRemoveItem(cid,5903,1) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 130, 2)
            doPlayerAddOutfit(cid, 141, 2)
            setPlayerStorageValue(cid,mage+1,1)
        end
        else
            selfSay(noitems)
        end
        end
    else
        selfSay(already)
    end
    end

end

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Mage outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first mage addon' or 'second mage addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})

local node1 = keywordHandler:addKeyword({'first mage addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first mage addon you need to give me a winning lottery ticket if you are a female. Otherwise, you need to give me all kind of wands and rods, 10 magic sulphurs, 20 ankhs and a soul stone. Do you have it with you?'})
    node1:addChildKeyword({'yes'}, MageFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second mage addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second mage addon you need to give me 70 bat wings, 20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts if you are a female. Otherwise, you need to give me a ferumbras\' hat. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, MageSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())