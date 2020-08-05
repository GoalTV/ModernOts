local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
	
	local eventName = "bomber man"
	local pos = {x = 498, y = 541, z = 9}
	local ticket = 7491
	local price = 10000
	
	if(msgcontains(msg, 'ticket')) then
		if getPlayerEventType(cid) == 1 then
			npcHandler:say('Do you want to purchase the ' .. eventName .. ' event ticket for ' .. price .. ' gold?', cid)
			Topic[talkUser] = 1
		else
			npcHandler:say('I am sorry, but the ' .. eventName .. ' event is closed.', cid)
			npcHandler:releaseFocus(cid)
			Topic[talkUser] = 0
		end
	elseif(msgcontains(msg, 'yes') and Topic[talkUser] == 1) then
		if getPlayerEventType(cid) == 1 then
			if doPlayerRemoveMoney(cid, price) == true then
				npcHandler:say('Here is your ticket, best of luck to you my friend.', cid)
				doPlayerAddItem(cid, ticket, 1)
				Topic[talkUser] = 0
			else
				npcHandler:say('You do not have enough money for the ' .. eventName .. ' ticket.', cid)
				npcHandler:releaseFocus(cid)
				Topic[talkUser] = 0
			end
		else
			npcHandler:say('I am sorry, but the ' .. eventName .. ' event is closed.', cid)
			npcHandler:releaseFocus(cid)
			Topic[talkUser] = 0
		end
	end
	
	if(msgcontains(msg, 'enter') or msgcontains(msg, 'event')) then
		if getPlayerEventType(cid) == 1 then
			npcHandler:say('Do you have the ticket for ' .. eventName .. '?', cid)
			Topic[talkUser] = 2
		else
			npcHandler:say('I am sorry, but the ' .. eventName .. ' event is closed.', cid)
			npcHandler:releaseFocus(cid)
			Topic[talkUser] = 0
		end
	elseif(msgcontains(msg, 'yes') and Topic[talkUser] == 2) then
		if getPlayerEventType(cid) == 1 then
			if getPlayerItemCount(cid, ticket) > 0 then
				npcHandler:say('Remember, you only have 20 minutes to kill or be killed. Good luck!', cid)
				doTeleportThing(cid, pos)
				doPlayerRemoveItem(cid, ticket, 1)
				npcHandler:releaseFocus(cid)
				Topic[talkUser] = 0
			else
				npcHandler:say('You do not have the ticket for ' .. eventName .. '.', cid)
				npcHandler:releaseFocus(cid)
				Topic[talkUser] = 0
			end
		else
			npcHandler:say('I am sorry, but the ' .. eventName .. ' event is closed.', cid)
			npcHandler:releaseFocus(cid)
			Topic[talkUser] = 0
		end
		
		return true
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())