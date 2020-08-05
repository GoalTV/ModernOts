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

	if(msgcontains(msg, 'The Spiritual Shielding') or msgcontains(msg, 'the spiritual shielding')) then
		selfSay('Here in the whiteflower temple you may receive the blessing of spiritual shielding. But I still must ask of you to sacrifice 10000 gold. Are you still interested?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
			if(doPlayerRemoveMoney(cid, 10000) == TRUE) then
				doPlayerAddBlessing(cid, 1)
				selfSay('So receive the shielding of your spirit, pilgrim. This is the first of five available blessings.', cid)
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