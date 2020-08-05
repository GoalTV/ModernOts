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

	function questBuy(cid, itemid)
		if isInArray({7368}, itemid) then
			if not canPlayerWearOutfit(cid, getPlayerSex(cid) == 0 and 157 or 152, 0) then
				npcHandler:say("Why should I trade with you?", cid)
				return false
			end
			
			npcHandler:say("Here is my offer.", cid)
		end
	end
    return true
end

npcHandler:setCallback(CALLBACK_ONBUY, questBuy)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())