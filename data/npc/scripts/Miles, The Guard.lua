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
			if getPlayerStorageValue(cid, storage_mission) == 3 then
				npcHandler:say("I'm fine. There's no trouble at all.", cid)
				talkState[talkUser] = 1
			else
				npcHandler:say("You must speak to {Kulag, the Guard} first.", cid)
				talkState[talkUser] = 0
			end
		else
			npcHandler:say("I don't feel like chatting.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, 'foresight of authorities') and talkState[talkUser] == 1 then
		npcHandler:say("Well, of course. We live in safety and peace.", cid)
		talkState[talkUser] = 2
	elseif msgcontains(msg, 'also for the gods') and talkState[talkUser] == 2 then
		npcHandler:say("I think the gods are looking after us and their hands shield us from evil.", cid)
		talkState[talkUser] = 3
	elseif msgcontains(msg, 'near future') and talkState[talkUser] == 3 then
		npcHandler:say("I think the gods and the government do their best to keep away harm from the citizens.", cid)
		setPlayerStorageValue(cid, storage_mission, 4)
		talkState[talkUser] = 0
	end
	
	return true
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())