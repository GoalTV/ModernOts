local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic ={}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

function greetCallback(cid)
	Topic[cid] = 1
	return true
end

function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if (not npcHandler:isFocused(cid)) then
        return false
    end

    if msgcontains(msg, 'vial') then
		npcHandler:say('We have a special offer right now for depositing vials. Are you interested in hearing it?', cid)
		Topic[cid] = 1
    elseif msgcontains(msg, 'yes') and Topic[cid] == 1 then
		npcHandler:say('Great! I\'ve signed you up for our bonus for lottery {ticket}. From now on, you will have the chance to win the potion belt addon!', cid)
		Topic[cid] = 0
    elseif msgcontains(msg, 'ticket') then
		npcHandler:say('Would you like to get a lottery ticket instead of the {deposit} for your vials.', cid)
		Topic[cid] = 1
    elseif msgcontains(msg, 'deposit') and Topic[cid] == 1 then      
		if getPlayerItemCount(cid, 7634) >= 100 or getPlayerItemCount(cid, 7635) >= 100 or getPlayerItemCount(cid, 7636) >= 100 then
			if doPlayerRemoveItem(cid, 7634, 100) or doPlayerRemoveItem(cid, 7635, 100) or doPlayerRemoveItem(cid, 7636, 100) then
				npcHandler:say('Here you are, good luck!', cid)
				doPlayerAddItem(cid, 5957, 1)
			else
				npcHandler:say('Sorry I need 100 empty vials from you for a lottery ticket', cid)
				Topic[cid] = 0
			end
		else
			npcHandler:say('Sorry I need 100 empty vials from you for a lottery ticket', cid)
			Topic[cid] = 0
		end
	end
	if msgcontains(msg, "belt" or "summoner") then
		if getPlayerItemCount(cid, 5958) >= 1 then
			npcHandler:say("Did you bring me a winning lottery ticket?", cid)
			Topic[cid] = 2
		end
	elseif msgcontains(msg, "yes") and Topic[cid] == 2 then
		if not canPlayerWearOutfit(cid, (getPlayerSex(cid) == 0 and 138 or 133), 1) then
			if doPlayerRemoveItem(cid, 5958, 1) then
				npcHandler:say("Congratulations! Here is your new fluid belt.", cid)
				doPlayerAddOutfit(cid, (getPlayerSex(cid) == 0 and 138 or 133), 1)
			else
				npcHandler:say("Sorry, but you need a winning lottery ticket.", cid)
				Topic[cid] = 0
			end
		else
			npcHandler:say("Sorry, but you can already wear this addon.", cid)
			Topic[cid] = 0
		end
    elseif msgcontains(msg, 'no') then
		npcHandler:say('Ok thanks.', cid)
		Topic[cid] = 0
	end
	return true
end

-------------------------------------------------SHOP---------------------------------------------------------
shopModule:addBuyableItem({'health potion'}, 7618, 45, 1, 'health potion')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 1, 'mana potion')
shopModule:addBuyableItem({'strong health'}, 7588, 100, 1, 'strong health potion')
shopModule:addBuyableItem({'strong mana'}, 7589, 80, 1, 'strong mana potion')
shopModule:addBuyableItem({'great health'}, 7591, 190, 1, 'great health potion')
shopModule:addBuyableItem({'great mana'}, 7590, 120, 1, 'great mana potion')
shopModule:addBuyableItem({'great spirit'}, 8472, 190, 1, 'great spirit potion')
shopModule:addBuyableItem({'ultimate health'}, 8473, 310, 1, 'ultimate health potion')

shopModule:addSellableItem({'normal potion flask', 'normal flask'}, 7636, 5, 'empty small potion flask')
shopModule:addSellableItem({'strong potion flask', 'strong flask'}, 7634, 10, 'empty strong potion flask')
shopModule:addSellableItem({'great potion flask', 'great flask'}, 7635, 15, 'empty great potion flask')


shopModule:addBuyableItemContainer({'bp hp'}, 2000, 7618, 900, 1, 'backpack of health potions')
shopModule:addBuyableItemContainer({'bp mp'}, 2001, 7620, 1000, 1, 'backpack of mana potions')
shopModule:addBuyableItemContainer({'bp shp'}, 2000, 7588, 2000, 1, 'backpack of strong health potions')
shopModule:addBuyableItemContainer({'bp smp'}, 2001, 7589, 1600, 1, 'backpack of strong mana potions')
shopModule:addBuyableItemContainer({'bp ghp'}, 2000, 7591, 3800, 1, 'backpack of great health potions')
shopModule:addBuyableItemContainer({'bp gmp'}, 2001, 7590, 2400, 1, 'backpack of great mana potions')
shopModule:addBuyableItemContainer({'bp gsp'}, 1999, 8472, 3820, 1, 'backpack of great spirit potions')
shopModule:addBuyableItemContainer({'bp uhp'}, 2000, 8473, 6200, 1, 'backpack of ultimate health potions')

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())