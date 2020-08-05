local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'bow'}, 2456, 400, 1,'bow')
shopModule:addBuyableItem({'crossbow'}, 2455, 500, 1,'crossbow')
shopModule:addBuyableItem({'royal spear'}, 7378, 15, 1,'royal spear')
shopModule:addBuyableItem({'spear'}, 2389, 10, 1,'spear')
shopModule:addBuyableItem({'arrow'}, 2544, 3, 1,'arrow')
shopModule:addBuyableItem({'sniper arrow'}, 7364, 5, 1,'sniper arrow')
shopModule:addBuyableItem({'bolt'}, 2543, 4, 1,'bolt')
shopModule:addBuyableItem({'earth arrow'}, 7850, 5, 1,'earth arrow')
shopModule:addBuyableItem({'flaming arrow'}, 7840, 5, 1,'flaming arrow')
shopModule:addBuyableItem({'flash arrow'}, 7838, 5, 1,'flash arrow')
shopModule:addBuyableItem({'onyx arrow'}, 7365, 7, 1,'onyx arrow')
shopModule:addBuyableItem({'power bolt'}, 2547, 7, 1,'power bolt')
shopModule:addBuyableItem({'throwing star'}, 2399, 42, 1,'throwing star')
shopModule:addBuyableItem({'shiver arrow'}, 7839, 5, 1,'shiver arrow')
shopModule:addBuyableItem({'piercing bolt'}, 7363, 5, 1,'piercing bolt')
shopModule:addBuyableItem({'assassin star'}, 7368, 100, 1,'assassin star')
shopModule:addBuyableItem({'infernal bolt'}, 6529, 30, 1,'infernal bolt')
shopModule:addBuyableItem({'throwing knife'}, 2410, 25, 1,'throwing knife')
shopModule:addBuyableItem({'small stone'}, 1294, 1, 1,'small stone')
shopModule:addBuyableItem({'poison arrow'}, 2545, 2, 1,'poison arrow')
shopModule:addBuyableItem({'viper star'}, 7366, 2, 1,'viper star')
shopModule:addBuyableItem({'burst arrow'}, 2546, 20, 1,'burst arrow')

shopModule:addSellableItem({'bow'}, 2456, 130,'bow')
shopModule:addSellableItem({'crossbow'}, 2455, 160,'crossbow')
shopModule:addSellableItem({'spear'}, 2389, 3,'spear')

npcHandler:addModule(FocusModule:new())