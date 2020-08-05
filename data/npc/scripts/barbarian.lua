local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local barbarian    = 22015    


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- BARBARIAN START --
function BarbarianFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,barbarian)
    if addon == -1 then
        if getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5886) >= 10 then
        if doPlayerRemoveItem(cid,5884,1) and doPlayerRemoveItem(cid,5885,1) and doPlayerRemoveItem(cid,5911,50) and doPlayerRemoveItem(cid,5910,50) and doPlayerRemoveItem(cid,5886,10) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 143, 2)
            doPlayerAddOutfit(cid, 147, 2)
            setPlayerStorageValue(cid,barbarian,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function BarbarianSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,barbarian+1)
    if addon == -1 then
        if getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and getPlayerItemCount(cid,5876) >= 50 then
        if doPlayerRemoveItem(cid,5880,100) and doPlayerRemoveItem(cid,5892,1) and doPlayerRemoveItem(cid,5893,50) and doPlayerRemoveItem(cid,5876,50) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 143, 1)
            doPlayerAddOutfit(cid, 147, 1)
            setPlayerStorageValue(cid,barbarian+1,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
-- BARBARIAN END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Barbarian outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first barbarian addon' or 'second barbarian addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})

local node1 = keywordHandler:addKeyword({'first barbarian addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first barbarian addon you need to give me a fighting spirit, the warrior\'s sweat, 50 red pieces of cloth, 50 green pieces of cloth and 10 spider silk yarns. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, BarbarianFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second barbarian addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second barbarian addon you need to give me 100 iron ore, a chunk of crude iron, 50 behemoth fangs and 50 lizard leathers. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, BarbarianSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())