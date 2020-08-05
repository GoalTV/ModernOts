local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local shaman        = 22029


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- SHAMAN START --
function ShamanFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,shaman)
    if addon == -1 then
        if getPlayerItemCount(cid,3955) >= 5 and getPlayerItemCount(cid,5015) >= 1 then
        if doPlayerRemoveItem(cid,3955,5) and doPlayerRemoveItem(cid,5015,1) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 154, 1)
            doPlayerAddOutfit(cid, 158, 1)
            setPlayerStorageValue(cid,shaman,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function ShamanSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,shaman+1)
    if addon == -1 then
        if getPlayerItemCount(cid,3966) >= 5 and getPlayerItemCount(cid,3967) >= 5 then
        if doPlayerRemoveItem(cid,3966,5) and doPlayerRemoveItem(cid,3967,5) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 154, 2)
            doPlayerAddOutfit(cid, 158, 2)
            setPlayerStorageValue(cid,shaman+1,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
-- SHAMAN END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Shaman outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first shaman addon' or 'second shaman addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})

local node1 = keywordHandler:addKeyword({'first shaman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first shaman addon you need to give me 5 dworf voodoo dolls and a mandrake. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, ShamanFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second shaman addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second shaman addon you need to give me 5 banana staffs and 5 tribal masks. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, ShamanSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())