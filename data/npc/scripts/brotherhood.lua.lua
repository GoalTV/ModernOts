-- BROTHERHOOD OF BONES ADDONS & NECROMANCER SHIELD BY Frankit0 --

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local brotherhood        = 37335


local outfit    = 'Here is your outfit and your Necromancer Shield, use it wisely!!'
local newaddon    = 'Here you are, enjoy your new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon!'
        
-- BROTHERHOOD START --
function BrotherhoodFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,brotherhood)
    if addon == -1 then
        if getPlayerItemCount(cid,6500) >= 1500 then
        if doPlayerRemoveItem(cid,6500,1500) then
            selfSay(outfit)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 278, 1)
            doPlayerAddOutfit(cid, 279, 1)
        doPlayerAddItem(cid, 6433, 1)
            setPlayerStorageValue(cid,brotherhood,1)
        end
        else
            selfSay(noitems)
        end
    end
    end

end

function BrotherhoodSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,brotherhood+1)
    if addon == -1 then
        if getPlayerItemCount(cid,6500) >= 1000 then
        if doPlayerRemoveItem(cid,6500,1000) then
            selfSay(newaddon)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 278, 2)
            doPlayerAddOutfit(cid, 279, 2)
            setPlayerStorageValue(cid,brotherhood+1,1)
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
-- BROTHERHOOD END --

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Brotherhood of Bones outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first brotherhood addon' or 'second brotherhood addon'. Assuming that you already collected all the required pieces, say 'yes'"})

local node1 = keywordHandler:addKeyword({'first brotherhood addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first brotherhood of bones addon you need to give me 1500 demonic essences. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, BrotherhoodFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second brotherhood addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second brotherhood of bones addon you need to give me 1000 demonic essences. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, BrotherhoodSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())  