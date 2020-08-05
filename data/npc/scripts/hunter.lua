local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Storage IDs --
local hunter        = 22003


local newaddon    = 'Here you are, enjoy your brand new addon!'
local noitems        = 'You do not have all the required items.'
local noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
local already        = 'It seems you already have this addon, don\'t you try to mock me son!'
        
-- HUNTER START --
function HunterFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,hunter)
    if addon == -1 then
        if getPlayerItemCount(cid,5947) >= 1 and getPlayerItemCount(cid,5876) >= 100 and getPlayerItemCount(cid,5948) >= 100 and getPlayerItemCount(cid,5891) >= 5 and getPlayerItemCount(cid,5887) >= 1 and getPlayerItemCount(cid,5888) >= 1 and getPlayerItemCount(cid,5889) >= 1 then
        if doPlayerRemoveItem(cid,5947,1) and doPlayerRemoveItem(cid,5876,100) and doPlayerRemoveItem(cid,5948,100) and doPlayerRemoveItem(cid,5891,5) and doPlayerRemoveItem(cid,5887,1) and doPlayerRemoveItem(cid,5888,1) and doPlayerRemoveItem(cid,5889,1) then
            npcHandler:say(newaddon,cid)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 129, 1)
            doPlayerAddOutfit(cid, 137, 2)
            setPlayerStorageValue(cid,hunter,1)
        end
        else
            npcHandler:say(noitems,cid)
			talk_state = 0
        end
    else
        npcHandler:say(already,cid)
		talk_state = 0
    end
    end

end

function HunterSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,hunter+1)
    if addon == -1 then
        if getPlayerItemCount(cid,5875) >= 1 then
        if doPlayerRemoveItem(cid,5875,1) then
            npcHandler:say(newaddon,cid)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 129, 2)
            doPlayerAddOutfit(cid, 137, 2)
            setPlayerStorageValue(cid,hunter+1,1)
        end
        else
            npcHandler:say(noitems,cid)
			talk_state = 0
        end
    else
        npcHandler:say(already,cid)
		talk_state = 0
    end
    end

end

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you first & second addons of the Hunter outfit."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you do is that you type 'first hunter addon' or 'second hunter addon'. Assuming that you already collected all the required pieces, say 'yes' and voíla - you got yourself an addon!"})

local node1 = keywordHandler:addKeyword({'first hunter addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first hunter addon you need to give me an Elane\'s crossbow, 100 lizard leathers, 100 red dragon leather, 5 enchanted chicken wings, piece of royal steel, piece of hell steel and piece of draconian steel. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, HunterFirst, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'second hunter addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second hunter addon you need to give me a pair of sniper gloves. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, HunterSecond, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())