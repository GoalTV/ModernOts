local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end
--- start--
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'The Spark of the Phoenix') or msgcontains(msg, 'the spark of the phoenix')) then
		selfSay('Blessed pilgrim seeking the spark of the phoenix, would you like to receive my part of the blessing for 10000 gold coins?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
			if(doPlayerRemoveMoney(cid, 10000) == TRUE) then
				doPlayerAddBlessing(cid, 4)
				selfSay('So receive the mark of the flame and be blessed by the phoenix, pilgrim. This is the fourth of five available blessings.', cid)
				doSendMagicEffect(getCreaturePosition(cid), math.random(39, 39))
			else
				selfSay('Sorry, You need to sacrifce 10000 gold coins.', cid)
			end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('So why you came?', cid)
	end

	return true
end
-- ends--
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())