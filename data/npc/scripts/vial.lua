local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end
-- start --
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'vial') or msgcontains(msg, 'flask')) then
		selfSay('Do you want to participate on a lottery for a vial belt? had to bring me 100 empty [vials].', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if getPlayerItemCount(cid, 7636) >= 100 or getPlayerItemCount(cid, 7635) >= 100 or getPlayerItemCount(cid, 7634) >= 100 then
		if doPlayerRemoveItem(cid, 7636,100) or doPlayerRemoveItem(cid, 7635,100) or doPlayerRemoveItem(cid, 7634,100) then
			doPlayerAddItem(cid, 5957, 1)
			selfSay('Here you are.', cid)
		else
			selfSay('Sorry, you don\'t have many vials.', cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end
end
-- ends --
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())