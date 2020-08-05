local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}

function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
			return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	-- CONFIG --
	local storage_join = 2101
	local storage_mission = 2102
	-- END CONFIG --
	
	if msgcontains(msg, 'trouble') then
		if getPlayerStorageValue(cid, storage_join) == 1 then
			npcHandler:say("I think there is a pickpocket in town.", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("I don't feel like chatting.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, 'authorities') and talkState[talkUser] == 1 then
		npcHandler:say("Well, sooner or later we will get hold of that delinquent. That's for sure.", cid)
		talkState[talkUser] = 2
	elseif msgcontains(msg, 'avoided') and talkState[talkUser] == 2 then
		npcHandler:say("You can't tell by a person's appearance who is a pickpocket and who isn't. You simply can't close the city gates for everyone.", cid)
		talkState[talkUser] = 3
	elseif msgcontains(msg, 'gods allow') and talkState[talkUser] == 3 then
		npcHandler:say("If the gods had created the world a paradise, no one had to steal at all.", cid)
		setPlayerStorageValue(cid, storage_mission, 1)
		talkState[talkUser] = 0
	end
	
	return true
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())