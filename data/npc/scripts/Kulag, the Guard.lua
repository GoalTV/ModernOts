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
			if getPlayerStorageValue(cid, storage_mission) == 2 then
				npcHandler:say("You adventurers become more and more of a pest.", cid)
				talkState[talkUser] = 1
			else
				npcHandler:say("You must speak to {Grof, the Guard} first.", cid)
				talkState[talkUser] = 0
			end
		else
			npcHandler:say("I don't feel like chatting.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, 'authorities') and talkState[talkUser] == 1 then
		npcHandler:say("They should throw you all into jail instead of giving you all those quests and rewards an honest watchman can only dream about.", cid)
		setPlayerStorageValue(cid, storage_mission, 3)
		talkState[talkUser] = 0
	end
	
	return true
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())