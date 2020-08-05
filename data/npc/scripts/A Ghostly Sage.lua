local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
-- OTServ event handling functions end

local god_flower = 2100
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if msgcontains(msg, 'pass') or msgcontains(msg, 'passage') then
		npcHandler:say('I will exchange the key to pass this door, if you bring me a {God Flower}.', cid)
	elseif msgcontains(msg, 'god flower') then
		if getPlayerItemCount(cid, god_flower) >= 1 then
			npcHandler:say('Did you bring me a {God Flower}?', cid)
			talk_state = 1
		else
			npcHandler:say('You do not have this item, I will not settle for anything less.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 1 then
		if getPlayerItemCount(cid, 2100) >= 1 then
			if doPlayerRemoveItem(cid, 2100, 1) == TRUE then
				npcHandler:say('Thank you for this lovely flower, it smells so delightful. Here is your key, good luck!', cid)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
				item = doPlayerAddItem(cid, 2090, 1)
				doItemSetAttribute(item, "aid", 3700)
				talk_state = 0
			end
		else
			npcHandler:say('You lier, leave at once.', cid)
			talk_state = 0
		end
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())