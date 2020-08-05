local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if msgcontains(msg, "job") or  msgcontains(msg, "mission") then
		local money = getPlayerMoney(cid)
		if (money >= 10) then
			npcHandler:say("Oh, sorry, I was distracted, what did you say?", cid)
			doPlayerRemoveMoney(cid, math.random(1, 10))
		elseif (money > 0 and money < 10) then
			npcHandler:say("Oh, sorry, I was distracted, what did you say?", cid)
			doPlayerRemoveMoney(cid, money)
		else
			npcHandler:say("Oh sorry, I have to hurry, bye!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif msgcontains(msg, "time") then
		local watch = getPlayerItemCount(cid, 2036)
		if (watch >= 1) then
			doPlayerRemoveItem(cid, 2036, 1)
			npcHandler:say("Please don't be so rude to look for the time if you are talking to me.", cid)
		else
			npcHandler:say("Please don't be so rude to look for the time if you are talking to me.", cid)
		end
	elseif msgcontains(msg, "tibia") then
		npcHandler:say("I'd like to visit the beach more often, but I guess it's too dangerous.", cid)
	elseif msgcontains(msg, "excalibug") then
		npcHandler:say("Oh, I am just a girl and know nothing about magic swords and such things.", cid)
	elseif msgcontains(msg, "thief") then
		selfSay("Oh sorry, I have to hurry, bye!", cid)
		npcHandler:releaseFocus(cid)
	end
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 