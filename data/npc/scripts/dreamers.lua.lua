-- NIGHTMARE ADDONS & NIGHTMARE SHIELD BY Frankit0 --

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local dreamers        = 37326


local outfit    = 'Here is your outfit and your Nightmare Shield, use it wisely!!'
local newaddon    = 'Here you are, enjoy your new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon!'
        
-- DREAMERS START --
function DreamersFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,dreamers)
    if addon == -1 then
        if getPlayerItemCount(cid,6500) >= 1500 then
        if doPlayerRemoveItem(cid,6500,1500) then
            selfSay(outfit)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 269, 1)
            doPlayerAddOutfit(cid, 268, 1)
        doPlayerAddItem(cid, 6391, 1)
            setPlayerStorageValue(cid,dreamers,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function DreamersSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,dreamers+1)
    if addon == -1 then
        if getPlayerItemCount(cid,6500) >= 1000 then
        if doPlayerRemoveItem(cid,6500,1000) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 268, 2)
            doPlayerAddOutfit(cid, 269, 2)
            setPlayerStorageValue(cid,dreamers+1,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
-- DREAMERS END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Nightmare outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first nightmare addon' or 'second nightmare addon'. Assuming that you already collected all the required pieces, say 'yes'"})

local node1 = keywordHandler:addKeyword({'first nightmare addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first nightmare addon you need to give me 1500 demonic essences. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, DreamersFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second nightmare addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second nightmare addon you need to give me 1000 demonic essences. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, DreamersSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())  