local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local beggar        = 22027


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- BEGGAR START --
function BeggarFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,beggar)
    if addon == -1 then
        if getPlayerItemCount(cid,5883) >= 100 and money >= 20000 then
        if doPlayerRemoveItem(cid,5883,100) and doPlayerRemoveMoney(cid,20000) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 153, 1)
            doPlayerAddOutfit(cid, 157, 1)
            setPlayerStorageValue(cid,beggar,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function BeggarSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,beggar+1)
    if addon == -1 then
        if getPlayerItemCount(cid,6107) >= 1 then
        if doPlayerRemoveItem(cid,6107,1) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 153, 2)
            doPlayerAddOutfit(cid, 157, 2)
            setPlayerStorageValue(cid,beggar+1,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
-- BEGGAR END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Beggar outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first beggar addon' or 'second beggar addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})

local node1 = keywordHandler:addKeyword({'first beggar addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first beggar addon you need to give me 100 ape furs and 20,000 gold pieces. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, BeggarFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second beggar addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second beggar addon you need to give me simon the beggar\'s staff. Do you have it with you?'})
    node2:addChildKeyword({'yes'}, BeggarSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

	elseif msgcontains(msg,'key') then
selfSay('Do you want to buy the Key to Fibul for 800 gold coins?', cid)
talkState[talkUser] = 5

elseif msgcontains(msg,'no') and talkState[talkUser] == 5 then
selfSay('As you wish.', cid)
talkState[talkUser] = 0

elseif msgcontains(msg,'yes') and talkState[talkUser] == 5 then
if getPlayerMoney(cid) >= 800 then
doPlayerRemoveMoney(cid, 800)
local key = doCreateItemEx(2087)
doSetItemActionId(key, 3940)
doPlayerAddItemEx(cid,key)
selfSay('Here you are.', cid)
talkState[talkUser] = 0
else
selfSay('You don\'t have enough money.', cid)
talkState[talkUser] = 0
end
else
selfSay('Only nonsense on your mind, eh?', cid)
talkState[talkUser] = 1
end

return TRUE
end

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())