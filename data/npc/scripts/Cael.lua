local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

item = 'You do not have the required items.'
done = 'Here you are.'

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

			if msgcontains(msg, 'timininolindo') then
			if getPlayerItemCount(cid,2148) >= 1 then
				selfSay('Did you bring me the red lantern?', cid)
				talk_state = 1
			else
				selfSay('I need a {timininolindo}, to give you the Dragon Statue. Come back when you have them.', cid)
				talk_state = 0
			end

			elseif msgcontains(msg, 'yes') and talk_state == 1 then
			talk_state = 0
			if getPlayerItemCount(cid,2148) >= 1 then
			if doPlayerRemoveItem(cid,2148, 1) == TRUE then
							selfSay(done, cid)
			doPlayerAddItem(cid, 2160, 100)
			end
			else
				selfSay(item, cid)
			end

elseif msgcontains(msg, 'red piece of cloth') then
if getPlayerItemCount(cid,5911) >= 1 then
selfSay('Did you bring me the red piece of cloth?', cid)
talk_state = 2
else
selfSay('I need a {red piece of cloth}, to give you the Dragon Throne. Come back when you have it.', cid)
talk_state = 0
end
elseif msgcontains(msg, 'yes') and talk_state == 2 then
talk_state = 0
if getPlayerItemCount(cid,5911) >= 1 then
if doPlayerRemoveItem(cid,5911,1) == TRUE then
				selfSay(done, cid)
doPlayerAddItem(cid,11199,1)
end
else
selfSay(item, cid)
end

        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
            selfSay('So Leave, LEAVE ME NOW!')
            talk_state = 0
        end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
