local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)        	end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)     	end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()                    		npcHandler:onThink()                    	end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if msgcontains(msg, "hi") or msgcontains(msg, "hello") or msgcontains(msg, "hey") then
		npcHandler:releaseFocus(cid)
	end
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 