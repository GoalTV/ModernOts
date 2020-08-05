local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

function pick_quest(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	local level = getPlayerLevel(cid)
	for k, v in pairs(questmonster) do
		local required = tonumber(k)
		if(level >= required) then
			for i, v in ipairs(v) do	
				local storage = getPlayerStorageValue(cid, v.storage)
				if(storage == -1) then
					npcHandler:say("Eu poderia us�-lo no assassinato de ".. v.amount .. " ".. string.lower(v.monster) .. ". Voc� gostaria de aceitar a quest?", cid)
					parameters.quest = v
					return true
				elseif(storage == v.amount) then
					setPlayerStorageValue(cid, v.storage, -2)
					npcHandler:say("Nossa! Eu n�o esperava que voc� terminasse tudo t�o r�pido. Talvez eu tenha mais quests para voc�", cid)
					if(v.on_turn_in) then
						v.on_turn_in(cid, v)
					end
					npcHandler:resetNpc()
					return true
				end
			end
		end
	end
	npcHandler:say("Eu n�o tenho mais quests para voc�! Retorne mais tarde!", cid)
	npcHandler:resetNpc()
	return true
end
	
function accept_quest(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	local quest = node:getParent():getParameters().quest
	local storage = quest.storage
	setPlayerStorageValue(cid, storage, 0)
	npcHandler:say("Estou confiando em voc�. N�o me decepcione!", cid)
	if(quest.on_accept) then quest.on_accept(cid, quest) end
	npcHandler:resetNpc()
	return true
end

-- Keyword "Quest". Se algu�m quiser ajudar a deixar igual ao NPC do Global, adicione os keyword's com os nomes para as respectivas quest's. 
local questNode = keywordHandler:addKeyword({'quest'}, pick_quest, {})
	questNode:addChildKeyword({'yes'}, accept_quest, {})
	questNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Dif�cil demais para voc�, n�o �?'})

	
npcHandler:addModule(FocusModule:new())
