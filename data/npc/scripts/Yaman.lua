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
	
	if msgcontains(msg, "warrior's sweat") then
		if getPlayerItemCount(cid, 2475) >= 8 then
			npcHandler:say("Are you sure you would like to trade {eight} or your helmet's for a {flas of warrior's sweat}?", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("Sorry, you do not have {eight} Warrior Helmets.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 1 then
		if getPlayerItemCount(cid, 2475) >= 8 then
			doPlayerRemoveItem(cid, 2475, 8)
			npcHandler:say("Here you are.", cid)
			doPlayerAddItem(cid, 5885, 1)
			talkState[talkUser] = 0
		else
			npcHandler:say("Sorry, you do not have {eight} Warrior Helmets.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, "no") then
		npcHandler:say("Then not.", cid)
		talkState[talkUser] = 0
	end
	
	return true
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())