local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'beholder shield'},2518, 1200,'beholder shield')
shopModule:addSellableItem({'crown shield'},2519, 8000,'crown shield')
shopModule:addSellableItem({'dragon shield'},2516, 4000,'dragon shield')
shopModule:addSellableItem({'guardian shield'},2515, 2000,'guardian shield')
shopModule:addSellableItem({'phoenix shield'},2539, 16000,'phoenix shield')
shopModule:addSellableItem({'blue robe'},2656, 10000,'blue robe')
shopModule:addSellableItem({'crown armor'},2487, 12000,'crown armor')
shopModule:addSellableItem({'noble armor'},2486, 900,'noble armor')
shopModule:addSellableItem({'boots of haste'},2195, 30000,'boots of haste')
shopModule:addSellableItem({'broad sword'},2413, 500,'broad sword')
shopModule:addSellableItem({'dragon lance'},2414, 9000,'dragon lance')
shopModule:addSellableItem({'fire axe'},2432, 8000,'fire axe')
shopModule:addSellableItem({'fire sword'},2392, 4000,'fire sword')
shopModule:addSellableItem({'ice rapier'},2396, 1000,'ice rapier')
shopModule:addSellableItem({'obsidian lance'},2425, 500,'obsidian lance')
shopModule:addSellableItem({'spike sword'},2383, 1000,'spike sword')
shopModule:addSellableItem({'war hammer'},2391, 1200,'war hammer')
shopModule:addSellableItem({'glorious axe'},7454, 3000,'glorious axe')
shopModule:addSellableItem({'thaian sword'},7391, 16000,'thaian sword')
shopModule:addSellableItem({'shadow sceptre'},7451, 10000,'shadow sceptre')
shopModule:addSellableItem({'queen\'s sceptre'},7410, 20000,'queen\'s sceptre')
shopModule:addSellableItem({'butcher\'s axe'},7412, 18000,'butcher\'s axe')
shopModule:addSellableItem({'angelic axe'},7436, 5000,'angelic axe')
shopModule:addSellableItem({'crown helmet'},2491, 2500,'crown helmet')
shopModule:addSellableItem({'crusader helmet'},2497, 6000,'crusader helmet')
shopModule:addSellableItem({'royal helmet'},2498, 30000,'royal helmet')
shopModule:addSellableItem({'earth spike sword'},7854, 1000,'earth spike sword')
shopModule:addSellableItem({'energy spike sword'},7869, 1000,'energy spike sword')
shopModule:addSellableItem({'fiery spike sword'},7744, 1000,'fiery spike sword')
shopModule:addSellableItem({'icy spike sword'},7763, 1000,'icy spike sword')
shopModule:addSellableItem({'earth war hammer'},7868, 1200,'earth war hammer')
shopModule:addSellableItem({'energy war hammer'},7883, 1200,'energy war hammer')
shopModule:addSellableItem({'fiery war hammer'},7758, 1200,'fiery war hammer')
shopModule:addSellableItem({'icy war hammer'},7777, 1200,'icy war hammer')


shopModule:addSellableItem({'bonebreaker'},7428, 10000,'bonebreaker')
shopModule:addSellableItem({'dragon hammer'},2434, 2000,'dragon hammer')
shopModule:addSellableItem({'dreaded cleaver'},7419, 15000,'dreaded cleaver')
shopModule:addSellableItem({'giant sword'},2393, 17000,'giant sword')
shopModule:addSellableItem({'haunted blade'},7407, 8000,'haunted blade')
shopModule:addSellableItem({'knight axe'},2430, 2000,'knight axe')
shopModule:addSellableItem({'onyx flail'},7421, 22000,'onyx flail')
shopModule:addSellableItem({'ornamented axe'},7411, 20000,'ornamented axe')
shopModule:addSellableItem({'poison dagger'},2411, 50,'poison dagger')
shopModule:addSellableItem({'scimitar'},2419, 150,'scimitar')
shopModule:addSellableItem({'serpent sword'},2409, 900,'serpent sword')
shopModule:addSellableItem({'skull staff'},2436, 6000,'skull staff')
shopModule:addSellableItem({'titan axe'},7413, 4000,'titan axe')
shopModule:addSellableItem({'dark armor'},2489, 400,'dark armor')
shopModule:addSellableItem({'knight armor'},2476, 5000,'knight armor')
shopModule:addSellableItem({'dark helmet'},2490, 250,'dark helmet')
shopModule:addSellableItem({'mystic turban'},2663, 150,'mystic turban')
shopModule:addSellableItem({'strange helmet'},2479, 500,'strange helmet')
shopModule:addSellableItem({'warrior helmet'},2475, 5000,'warrior helmet')
shopModule:addSellableItem({'knight legs'},2477, 5000,'knight legs')
shopModule:addSellableItem({'ancient shield'},2532, 900,'ancient shield')
shopModule:addSellableItem({'black shield'},2529, 800,'black shield')
shopModule:addSellableItem({'tower shield'},2528, 8000,'tower shield')
shopModule:addSellableItem({'vampire shield'},2534, 15000,'vampire shield')


shopModule:addSellableItem({'axe ring'},2208, 100,'axe ring')
shopModule:addSellableItem({'club ring'},2209, 100,'club ring')
shopModule:addSellableItem({'power ring'},2166, 50,'power ring')
shopModule:addSellableItem({'stealth ring'},2165, 200,'stealth ring')
shopModule:addSellableItem({'sword ring'},2207, 100,'sword ring')
shopModule:addSellableItem({'bronze amulet'},2172, 50,'bronze amulet')
shopModule:addSellableItem({'elven amulet'},2198, 100,'elven amulet')
shopModule:addSellableItem({'garlic necklace'},2199, 50,'garlic necklace')
shopModule:addSellableItem({'stone skin amulet'},2197, 500,'stone skin amulet')
shopModule:addSellableItem({'wand of cosmic energy'},2189, 2000,'wand of cosmic energy')
shopModule:addSellableItem({'wand of decay'},2188, 1000,'wand of decay')
shopModule:addSellableItem({'wand of draconia'},8921, 1500,'wand of draconia')
shopModule:addSellableItem({'wand of dragonbreath'},2191, 200,'wand of dragonbreath')
shopModule:addSellableItem({'wand of inferno'},2187, 3000,'wand of inferno')
shopModule:addSellableItem({'wand of starstorm'},8920, 3600,'wand of starstorm')
shopModule:addSellableItem({'wand of voodoo'},8922, 4400,'wand of voodoo')
shopModule:addSellableItem({'wand of vortex'},2190, 100,'wand of vortex')
shopModule:addSellableItem({'life crystal'},2177, 50,'life crystal')
shopModule:addSellableItem({'magic lightwand'},2162, 35,'magic lightwand')
shopModule:addSellableItem({'mind stone'},2178, 100,'mind stone')
shopModule:addSellableItem({'orb'},2176, 750,'orb')


shopModule:addSellableItem({'dwarven ring'},2213, 100,'dwarven ring')
shopModule:addSellableItem({'energy ring'},2167, 100,'energy ring')
shopModule:addSellableItem({'life ring'},2168, 50,'life ring')
shopModule:addSellableItem({'might ring'},2164, 250,'might ring')
shopModule:addSellableItem({'ring of healing'},2214, 100,'ring of healing')
shopModule:addSellableItem({'time ring'},2169, 100,'time ring')
shopModule:addSellableItem({'dragon necklace'},2201, 100,'dragon necklace')
shopModule:addSellableItem({'protection amulet'},2200, 100,'protection amulet')
shopModule:addSellableItem({'strange talisman'},2161, 30,'strange talisman')
shopModule:addSellableItem({'silver amulet'},2170, 50,'silver amulet')
shopModule:addSellableItem({'hailstorm rod'},2183, 3000,'hailstorm rod')
shopModule:addSellableItem({'moonlight rod'},2186, 200,'moonlight rod')
shopModule:addSellableItem({'necrotic rod'},2185, 1000,'necrotic rod')
shopModule:addSellableItem({'northwind rod'},8911, 1500,'northwind rod')
shopModule:addSellableItem({'snakebite rod'},2182, 100,'snakebite rod')
shopModule:addSellableItem({'springsprout rod'},8912, 3600,'springsprout rod')
shopModule:addSellableItem({'terra rod'},2181, 2000,'terra rod')
shopModule:addSellableItem({'underworld rod'},8910, 4400,'underworld rod')
shopModule:addSellableItem({'ankh'},2193, 100,'ankh')
shopModule:addSellableItem({'mysterious fetish'},2194, 50,'mysterious fetish')


-------BUYABLE


shopModule:addBuyableItem({'beholder shield'},2518, 7000,1,'beholder shield')
shopModule:addBuyableItem({'noble armor'},2486, 6000,1,'noble armor')
shopModule:addBuyableItem({'spike sword'},2383, 8000,1,'spike sword')
shopModule:addBuyableItem({'war hammer'},2391, 10000,1,'war hammer')


shopModule:addBuyableItem({'ice rapier'},2396, 5000,1,'ice rapier')
shopModule:addBuyableItem({'serpent sword'},2409, 6000,1,'serpent sword')
shopModule:addBuyableItem({'dark armor'},2489, 1500,1,'dark armor')
shopModule:addBuyableItem({'dark helmet'},2490, 1000,1,'dark helmet')
shopModule:addBuyableItem({'ancient shield'},2532, 5000,1,'ancient shield')


shopModule:addBuyableItem({'axe ring'},2208, 500,1,'axe ring')
shopModule:addBuyableItem({'club ring'},2209, 500,1,'club ring')
shopModule:addBuyableItem({'power ring'},2166, 100,1,'power ring')
shopModule:addBuyableItem({'stealth ring'},2165, 5000,1,'stealth ring')
shopModule:addBuyableItem({'sword ring'},2207, 500,1,'sword ring')
shopModule:addBuyableItem({'bronze amulet'},2172, 100,1,'bronze amulet')
shopModule:addBuyableItem({'elven amulet'},2198, 500,1,'elven amulet')
shopModule:addBuyableItem({'garlic necklace'},2199, 100,1,'garlic necklace')
shopModule:addBuyableItem({'stone skin amulet'},2197, 5000,1,'stone skin amulet')
shopModule:addBuyableItem({'magic lightwand'},2162, 120,1,'magic lightwand')


shopModule:addBuyableItem({'dwarven ring'},2213, 2000,1,'dwarven ring')
shopModule:addBuyableItem({'energy ring'},2167, 2000,1,'energy ring')
shopModule:addBuyableItem({'life ring'},2168, 900,1,'life ring')
shopModule:addBuyableItem({'might ring'},2164, 5000,1,'might ring')
shopModule:addBuyableItem({'ring of healing'},2214, 2000,1,'ring of healing')
shopModule:addBuyableItem({'time ring'},2169, 2000,1,'time ring')
shopModule:addBuyableItem({'dragon necklace'},2201, 1000,1,'dragon necklace')
shopModule:addBuyableItem({'protection amulet'},2200, 700,1,'protection amulet')
shopModule:addBuyableItem({'strange talisman'},2161, 100,1,'strange talisman')
shopModule:addBuyableItem({'silver amulet'},2170, 100,1,'silver amulet')


function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if (not npcHandler:isFocused(cid)) then
        return false
    end

        if msgcontains(msg, 'magic sulphur') then
                npcHandler:say('Do you want to change 3 fire swords for magic sulphur?', cid)
                talk_state = 1
        elseif msgcontains(msg, 'yes') and talk_state == 1 then
            if getPlayerItemCount(cid, 2392) >= 3 then
                if doPlayerRemoveMoney(cid, price) == true then
                    npcHandler:say('Here you are.', cid)
                    doPlayerRemoveItem(cid, 2392, 3)
                    doPlayerAddItem(cid, 5904, 1)
                    talk_state = 0
                end
            else
                npcHandler:say('You need to have 3 fire swords with you.', cid)
                talk_state = 0
            end
        elseif msgcontains(msg, 'warrior\'s sweat') then
                npcHandler:say('Do you want to change 4 warrior helmets for warrior\'s sweat?', cid)
                talk_state = 2
        elseif msgcontains(msg, 'yes') and talk_state == 2 then
            if getPlayerItemCount(cid, 2475) >= 4 then
                if doPlayerRemoveMoney(cid, price) == true then
                    npcHandler:say('Here you are.', cid)
                    doPlayerRemoveItem(cid, 2475, 4)
                    doPlayerAddItem(cid, 5885, 1)
                    talk_state = 0
                end
            else
                npcHandler:say('You need to have 4 warrior helmets with you.', cid)
                talk_state = 0
            end
        elseif msgcontains(msg, 'fighting spirit') then
                npcHandler:say('Do you want to change 2 royal helmets for fighting spirit?', cid)
                talk_state = 3
        elseif msgcontains(msg, 'yes') and talk_state == 3 then
            if getPlayerItemCount(cid, 2498) >= 2 then
                if doPlayerRemoveMoney(cid, price) == true then
                    npcHandler:say('Here you are.', cid)
                    doPlayerRemoveItem(cid, 2498, 2)
                    doPlayerAddItem(cid, 5884, 1)
                    talk_state = 0
                end
            else
                npcHandler:say('You need to have 2 royal helmets with you.', cid)
                talk_state = 0
            end
		elseif msgcontains(msg, 'enchanted chicken wing') then
                npcHandler:say('Do you want to change boots of haste for enchanted chicken wing?', cid)
                talk_state = 4
        elseif msgcontains(msg, 'yes') and talk_state == 4 then
            if getPlayerItemCount(cid, 2195) >= 1 then
                if doPlayerRemoveMoney(cid, price) == true then
                    npcHandler:say('Here you are.', cid)
                    doPlayerRemoveItem(cid, 2195, 1)
                    doPlayerAddItem(cid, 5891, 1)
                    talk_state = 0
                end
            else
                npcHandler:say('You need to have boots of haste with you.', cid)
                talk_state = 0
            end
------------------------------------------------ confirm no ------------------------------------------------
        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 4) then
            npcHandler:say('Ok thanks.', cid)
            talk_state = 0
        end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
