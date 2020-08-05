local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

		addon_need_premium = 'Desculpe-me, você precisa ser PA para ter Addon.'
		addon_have_already = 'Desculpe-me, você ja tem esse Addon.'
		addon_have_not_items = 'Desculpe-me, você não tem os itens.'
		addon_give = 'Tome o Addon.'
		player_gold = getPlayerItemCount(cid,2148)
		player_plat = getPlayerItemCount(cid,2152)*100
		player_crys = getPlayerItemCount(cid,2160)*10000
		player_money = player_gold + player_plat + player_crys
		
		if msgcontains(msg, 'addons') then
			selfSay('Eu poderia dar-lhe o second barbarian addon.')
		elseif msgcontains(msg, 'help') then
			selfSay('To buy second addon say \'second barbarian addon\'.')
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second barbarian addon') then
			if getPlayerPremium(cid) then
				if getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and getPlayerItemCount(cid,5876) >= 50 then
					selfSay('Poderia trazer 100 iron ore, 1 chunk of crude iron, 50 behemoth fangs and 50 lizard leathers?')
					talk_state = 12
				else
					selfSay('Eu preciso de 100 iron ore, 1 chunk of crude iron, 50 behemoth fangs and 50 lizard leathers, para dar-lhe o Second Barbarian Addon. Volte quando te-los.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 12 then
			talk_state = 0
			if getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and getPlayerItemCount(cid,5876) >= 50 then
				addon = getPlayerStorageValue(cid,60002)
				if addon == -1 then
					if doPlayerTakeItem(cid,5880,100) == 0 and doPlayerTakeItem(cid,5892,1) == 0 and doPlayerTakeItem(cid,5893,50) == 0 and doPlayerTakeItem(cid,5876,50) == 0 then
						selfSay(addon_give)
						doPlayerAddAddon(cid, 143, 1)
						doPlayerAddAddon(cid, 147, 1)
						setPlayerStorageValue(cid,60002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ confirm no ------------------------------------------------
		elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 38) then
			selfSay('Ok obrigado.')
			talk_state = 0
		end

	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())