--Made by Kaczi
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
shopModule:addBuyableItem({'spellbook'}, 2175, 150,1, 'spellbook')
shopModule:addBuyableItem({'magic lightwand'}, 2163, 400,1, 'magic lightwand')
shopModule:addBuyableItem({'small health'}, 8704, 20, 1, 'small health potion')
shopModule:addBuyableItem({'health potion'}, 7618, 45, 1, 'health potion')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 1, 'mana potion')
shopModule:addBuyableItem({'strong health'}, 7588, 100, 1, 'strong health potion')
shopModule:addBuyableItem({'strong mana'}, 7589, 80, 1, 'strong mana potion')
shopModule:addBuyableItem({'great health'}, 7591, 190, 1, 'great health potion')
shopModule:addBuyableItem({'great mana'}, 7590, 120, 1, 'great mana potion')
shopModule:addBuyableItem({'great spirit'}, 8472, 190, 1, 'great spirit potion')
shopModule:addBuyableItem({'ultimate health'}, 8473, 310, 1, 'ultimate health potion')
shopModule:addBuyableItem({'antidote potion'}, 8474, 50, 1, 'antidote potion')
shopModule:addSellableItem({'normal potion flask', 'normal flask'}, 7636, 5,'empty small potion flask')
shopModule:addSellableItem({'strong potion flask', 'strong flask'}, 7634, 10, 'empty strong potion flask')
shopModule:addSellableItem({'great potion flask', 'great flask'}, 7635, 15,'empty great potion flask')
shopModule:addBuyableItem({'blank'}, 2260, 10, 1, 'blank rune')
shopModule:addBuyableItem({'intense healing'}, 2265, 95, 1, 'intense healing rune')
shopModule:addBuyableItem({'ultimate healing'}, 2273, 175, 1, 'ultimate healing rune')
shopModule:addBuyableItem({'destroy field'}, 2261, 45, 3, 'destroy field rune')
shopModule:addBuyableItem({'light magic missile'}, 2287, 40, 10, 'light magic missile rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 120, 10, 'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball'}, 2304, 180, 4, 'great fireball rune')
shopModule:addBuyableItem({'explosion'}, 2313, 190, 6, 'explosion rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 325, 3, 'sudden death rune')
shopModule:addBuyableItem({'convince creature'}, 2290, 80, 1, 'convince creature rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 210, 1, 'chameleon rune')
shopModule:addBuyableItem({'desintegrate'}, 2310, 80,  3, 'desintegreate rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 350,  3, 'magic wall rune')
shopModule:addBuyableItemContainer({'bp blank'},     1998, 2260, 220, 1, 'bp blank rune')
shopModule:addBuyableItemContainer({'bp antidote'},         2003, 2266, 1320, 1, 'bp antidote rune')
shopModule:addBuyableItemContainer({'bp avalanche'},         2002, 2274, 3620,4, 'bp avalanche rune')
shopModule:addBuyableItemContainer({'bp chameleon'},         1998, 2291, 4220,1, 'bp chameleon rune')
shopModule:addBuyableItemContainer({'bp convince creature', 'bp convince'},     1998, 2290, 1620,1, 'bp convince creature rune')
shopModule:addBuyableItemContainer({'bp desintegrate'},     2001, 2310, 1620,3, 'bp desintegrate rune')
shopModule:addBuyableItemContainer({'bp destroy field', 'bp df'},     2003, 2261, 920,3,  'bp destroy field')
shopModule:addBuyableItemContainer({'bp energy field', 'bp ef'},     1998, 2277, 2320,3, 'bp energy field')
shopModule:addBuyableItemContainer({'bp energy wall', 'bp ew'},         2002, 2279, 6820,4, 'bp energy wall rune')
shopModule:addBuyableItemContainer({'bp explosion', 'bp xp'},         2001, 2313, 3820,6, 'bp explosion rune')
shopModule:addBuyableItemContainer({'bp fire bomb', 'bp fbomb'},         2000, 2305, 4720,2, 'bp fire bomb rune')
shopModule:addBuyableItemContainer({'bp fire field', 'bp ff'},         2000, 2301, 1720,3,  'bp fire field rune')
shopModule:addBuyableItemContainer({'bp fire wall', 'bp fw'},         2000, 2303, 4920,4, 'bp fire wall rune')
shopModule:addBuyableItemContainer({'bp great fireball', 'bp gfb'},     2000, 2304, 3620,4, 'bp great fireball rune')
shopModule:addBuyableItemContainer({'bp heavy magic missile', 'bp hmm'},     2001, 2311, 2420,10, 'bp heavy magic missile rune')
shopModule:addBuyableItemContainer({'bp intense healing', 'bp ih'},     2003, 2265, 1920,1, 'bp intense healing rune')
shopModule:addBuyableItemContainer({'bp light magic missile', 'bp lmm'},     1998, 2287, 820,10, 'bp light magic missile rune')
shopModule:addBuyableItemContainer({'bp magic wall', 'bp mw'},         1999, 2293, 7020,3, 'bp magic wall rune')
shopModule:addBuyableItemContainer({'bp poison field', 'bp pf'},     1998, 2285, 1320,3,  'bp poison field')
shopModule:addBuyableItemContainer({'bp poison wall', 'bp pw'},         1998, 2289, 4220,4, 'bp poison wall rune')
shopModule:addBuyableItemContainer({'bp stalagmite', 'bp sg'},         1998, 2292, 2400,10, 'bp stalagmite rune')
shopModule:addBuyableItemContainer({'bp sudden death', 'bp sd'},     2003, 2268, 6520,3, 'bp sudden death rune')
shopModule:addBuyableItemContainer({'bp uhp'}, 2000, 8473, 6200, 1, 'backpack of ultimate health potions')
shopModule:addBuyableItemContainer({'bp ultimate healing', 'bp uh'},     2002, 2273, 3520,3, 'bp ultimate healing rune')
shopModule:addBuyableItemContainer({'bp slhp'}, 2000, 8704, 400, 1, 'backpack of small health potions')
shopModule:addBuyableItemContainer({'bp hp'}, 2000, 7618, 900, 1, 'backpack of health potions')
shopModule:addBuyableItemContainer({'bp mp'}, 2001, 7620, 1000, 1, 'backpack of mana potions')
shopModule:addBuyableItemContainer({'bp shp'}, 2000, 7588, 2000, 1, 'backpack of strong health potions')
shopModule:addBuyableItemContainer({'bp smp'}, 2001, 7589, 1600, 1, 'backpack of strong mana potions')
shopModule:addBuyableItemContainer({'bp ghp'}, 2000, 7591, 3800, 1, 'backpack of great health potions')
shopModule:addBuyableItemContainer({'bp gmp'}, 2001, 7590, 2400, 1, 'backpack of great mana potions')
shopModule:addBuyableItemContainer({'bp gsp'}, 1999, 8472, 3800, 1, 'backpack of great spirit potions')
shopModule:addBuyableItemContainer({'bp ap'}, 2002, 8474, 2000, 1, 'backpack of antidote potions')
shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 500, 'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of decay', 'decay'}, 2188, 5000, 'wand of decay')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'necrotic rod', 'necrotic'}, 2185, 5000, 'necrotic rod')
shopModule:addBuyableItem({'terra rod', 'terra'}, 2181, 10000, 'terra rod')


local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if (not npcHandler:isFocused(cid)) then
        return false
    end
local epf1=getPlayerItemCount(cid,7635)
local epf2=getPlayerItemCount(cid,7634)
local epf3=getPlayerItemCount(cid,7636)
	if msgcontains(msg, 'ticket') or msgcontains(msg,'deposit') then
		npcHandler:say('Do you want to change your vials for a ticket?', cid)
        talk_state = 1
    elseif msgcontains(msg, 'yes') and talk_state == 1 then	
		if (epf1+epf2+epf3) >= 100 then
				if epf1 >= 100 then
					doPlayerRemoveItem(cid, 7635,100)
				else
					doPlayerRemoveItem(cid, 7635,epf1)
				end 
				if epf1 < 100 then
					if epf1+epf2<100 then
						doPlayerRemoveItem(cid, 7634,epf2)
					else
						doPlayerRemoveItem(cid, 7634,100-epf1)
					end
				else
					doPlayerRemoveItem(cid, 7634, 0)
				end
				if epf1+epf2 < 100 then
					doPlayerRemoveItem(cid, 7636, 100-epf1-epf2)
				else
					doPlayerRemoveItem(cid, 7636, 0)
				end
				doPlayerAddItem(cid, 5957, 1)
                npcHandler:say('Hre you are.', cid)
		else
			npcHandler:say('You don\'t have 100 vials.', cid)
		end
		talk_state = 0
	elseif msgcontains(msg,'first summoner addon') and getPlayerSex(cid)==1 then	
		npcHandler:say('Do you want to change a lottery ticker for the first summoner addon?', cid)		
		talk_state = 2
    elseif msgcontains(msg, 'yes') and talk_state == 2 then	
		if	getPlayerItemCount(cid,5958) >= 1 then
			npcHandler:say('Here you are.', cid)
			doPlayerRemoveItem(cid, 5958, 1)
			doPlayerAddOutfit(cid,133,1) 
			talk_state = 0
		else
			npcHandler:say('You don\'t have a lottery ticket.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg,'first mage addon') and getPlayerSex(cid)==0 then	
		npcHandler:say('Do you want to change a lottery ticker for the first mage addon?', cid)		
		talk_state = 3
    elseif msgcontains(msg, 'yes') and talk_state == 3 then	
		if	getPlayerItemCount(cid,5958) >= 1 then
			npcHandler:say('Here you are.', cid)
			doPlayerRemoveItem(cid, 5958, 1)
			doPlayerAddOutfit(cid,138,1) 
			talk_state = 0
		else
			npcHandler:say('You don\'t have a lottery ticket.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg,'first summoner addon') and getPlayerSex(cid)==0 then	
		npcHandler:say('Do you want to get first summoner addon?', cid)		
		talk_state = 4
    elseif msgcontains(msg, 'yes') and talk_state == 4 then	
		if	(getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,8920) >= 1 and getPlayerItemCount(cid,8921) >= 1 and getPlayerItemCount(cid,8922) >= 1 and
			getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,8910) >= 1 and getPlayerItemCount(cid,8911) >= 1 and getPlayerItemCount(cid,8912) >= 1 and
			getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1) then
			npcHandler:say('Here you are.', cid)
			doPlayerRemoveItem(cid, 2187, 1)
			doPlayerRemoveItem(cid, 2188, 1)
			doPlayerRemoveItem(cid, 2189, 1)
			doPlayerRemoveItem(cid, 2190, 1)
			doPlayerRemoveItem(cid, 2191, 1)
			doPlayerRemoveItem(cid, 8920, 1)
			doPlayerRemoveItem(cid, 8921, 1)
			doPlayerRemoveItem(cid, 8922, 1)	
			doPlayerRemoveItem(cid, 2181, 1)
			doPlayerRemoveItem(cid, 2182, 1)
			doPlayerRemoveItem(cid, 2183, 1)
			doPlayerRemoveItem(cid, 2185, 1)
			doPlayerRemoveItem(cid, 2186, 1)
			doPlayerRemoveItem(cid, 8910, 1)
			doPlayerRemoveItem(cid, 8911, 1)
			doPlayerRemoveItem(cid, 8912, 1)
			doPlayerRemoveItem(cid, 5904, 10)
			doPlayerRemoveItem(cid, 2193, 20)
			doPlayerRemoveItem(cid, 5809, 1)
			doPlayerAddOutfit(cid,141,1) 
			talk_state = 0
		else
			npcHandler:say('You don\'t have needed items.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg,'first mage addon') and getPlayerSex(cid)==1 then	
		npcHandler:say('Do you want to get first mage addon?', cid)		
		talk_state = 5
    elseif msgcontains(msg, 'yes') and talk_state == 5 then	
		if	(getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,8920) >= 1 and getPlayerItemCount(cid,8921) >= 1 and getPlayerItemCount(cid,8922) >= 1 and
			getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,8910) >= 1 and getPlayerItemCount(cid,8911) >= 1 and getPlayerItemCount(cid,8912) >= 1 and
			getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1) then
			npcHandler:say('Here you are.', cid)
			doPlayerRemoveItem(cid, 2187, 1)
			doPlayerRemoveItem(cid, 2188, 1)
			doPlayerRemoveItem(cid, 2189, 1)
			doPlayerRemoveItem(cid, 2190, 1)
			doPlayerRemoveItem(cid, 2191, 1)
			doPlayerRemoveItem(cid, 8920, 1)
			doPlayerRemoveItem(cid, 8921, 1)
			doPlayerRemoveItem(cid, 8922, 1)	
			doPlayerRemoveItem(cid, 2181, 1)
			doPlayerRemoveItem(cid, 2182, 1)
			doPlayerRemoveItem(cid, 2183, 1)
			doPlayerRemoveItem(cid, 2185, 1)
			doPlayerRemoveItem(cid, 2186, 1)
			doPlayerRemoveItem(cid, 8910, 1)
			doPlayerRemoveItem(cid, 8911, 1)
			doPlayerRemoveItem(cid, 8912, 1)
			doPlayerRemoveItem(cid, 5904, 10)
			doPlayerRemoveItem(cid, 2193, 20)
			doPlayerRemoveItem(cid, 5809, 1)
			doPlayerAddOutfit(cid,130,1) 
			talk_state = 0
		else
			npcHandler:say('You don\'t have needed items.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg,'second summoner addon') and getPlayerSex(cid)==1 then	
		npcHandler:say('Do you want to get the second summoner addon?', cid)		
		talk_state = 6
    elseif msgcontains(msg, 'yes') and talk_state == 6 then	
		if	(getPlayerItemCount(cid,5894) >= 70 and getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30) then
			npcHandler:say('Here you are.', cid)
			doPlayerRemoveItem(cid, 5894, 70)
			doPlayerRemoveItem(cid, 5911, 20)
			doPlayerRemoveItem(cid, 5883, 40)
			doPlayerRemoveItem(cid, 5922, 35)
			doPlayerRemoveItem(cid, 5886, 10)
			doPlayerRemoveItem(cid, 5881, 60)
			doPlayerRemoveItem(cid, 5882, 40)
			doPlayerRemoveItem(cid, 5904, 15)
			doPlayerRemoveItem(cid, 5905, 30)
			doPlayerAddOutfit(cid,133,2) 
			talk_state = 0
		else
			npcHandler:say('You don\'t have needed items.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg,'second mage addon') and getPlayerSex(cid)==0 then	
		npcHandler:say('Do you want to get the second mage addon?', cid)		
		talk_state = 7
    elseif msgcontains(msg, 'yes') and talk_state == 7 then	
		if	(getPlayerItemCount(cid,5894) >= 70 and getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30) then
			npcHandler:say('Here you are.', cid)
			doPlayerRemoveItem(cid, 5894, 70)
			doPlayerRemoveItem(cid, 5911, 20)
			doPlayerRemoveItem(cid, 5883, 40)
			doPlayerRemoveItem(cid, 5922, 35)
			doPlayerRemoveItem(cid, 5886, 10)
			doPlayerRemoveItem(cid, 5881, 60)
			doPlayerRemoveItem(cid, 5882, 40)
			doPlayerRemoveItem(cid, 5904, 15)
			doPlayerRemoveItem(cid, 5905, 30)
			doPlayerAddOutfit(cid,138,2) 
			talk_state = 0
		else
			npcHandler:say('You don\'t have needed items.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg,'second mage addon') and getPlayerSex(cid)==1 then	
		npcHandler:say('Do you want to get the second mage addon?', cid)		
		talk_state = 8
    elseif msgcontains(msg, 'yes') and talk_state == 8 then	
		if	getPlayerItemCount(cid,5903) >= 1 then
			npcHandler:say('Here you are.', cid)
			doPlayerRemoveItem(cid, 5903, 1)
			doPlayerAddOutfit(cid,130,2) 
			talk_state = 0
		else
			npcHandler:say('You don\'t have a ferumbras hat.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg,'second summoner addon') and getPlayerSex(cid)==0 then	
		npcHandler:say('Do you want to get the second summoner addon?', cid)		
		talk_state = 9
    elseif msgcontains(msg, 'yes') and talk_state == 9 then	
		if	getPlayerItemCount(cid,5903) >= 1 then
			npcHandler:say('Here you are.', cid)
			doPlayerRemoveItem(cid, 5903, 1)
			doPlayerAddOutfit(cid,141,2) 
			talk_state = 0
		else
			npcHandler:say('You don\'t have a ferumbras hat.', cid)
			talk_state = 0
		end
    elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 9) then
		npcHandler:say('Ok thanks.', cid)
		talk_state = 0
    end
    return TRUE
end
				

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())