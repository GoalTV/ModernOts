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

	if(msgcontains(msg, 'The Embrace of Tibia') or msgcontains(msg, 'the embrace of tibia')) then
		selfSay('Child of nature on a blessed pilgrimage, would you like to receive the embrace of Tibia for 10000 gold coins?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
			if(doPlayerRemoveMoney(cid, 10000) == TRUE) then
				doPlayerAddBlessing(cid, 2)
				selfSay('So receive the embrace of Tibia, pilgrim. This is the second of five available blessings.', cid)
				doSendMagicEffect(getCreaturePosition(cid), math.random(39, 39))
			else
				selfSay('Sorry, You need to sacrifce 10000 gold coins.', cid)
			end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('Okay, come back later.', cid)
	end

	return true
end
-- ends--
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())