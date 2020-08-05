local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function greetCallback(cid)
	Topic[cid] = 1
	return true
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'mission') then
		npcHandler:say("Did you bring the papers I asked you for?", cid)
		Topic[cid] = 1
	elseif Topic[cid] == 1 and msgcontains(msg, 'yes') then
		local storage = 88775
		if getPlayerItemCount(cid, 1954) >= 1 and getPlayerItemCount(cid, 4854) >= 1 then
			if getPlayerStorageValue(cid, storage) == -1 then
				npcHandler:say('Oh marvellous, please excuse me. I need to read this text immediately. Here, take this small reward of 500 gold pieces for your efforts.', cid)
				npcHandler:releaseFocus(cid)
				doPlayerRemoveItem(cid, 1954, 1, true)
				doPlayerRemoveItem(cid, 4854, 1, true)
				doPlayerAddItem(cid, 2152, 5)
				setPlayerStorageValue(cid, storage, 1)
				Topic[cid] = 0
			else
				npcHandler:say('You have already spoken to me before, why are you here?', cid)
				Topic[cid] = 0
			end
		else
			npcHandler:say('You do not have them, why are you here?', cid)
			Topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())