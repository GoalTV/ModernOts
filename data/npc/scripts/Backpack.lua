local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'backpack'}, 1988, 10, 1,'backpack')
shopModule:addBuyableItem({'green backpack'}, 1998, 10, 1,'green backpack')
shopModule:addBuyableItem({'red backpack'}, 2000, 10, 1,'red backpack')
shopModule:addBuyableItem({'purple backpack'}, 2001, 10, 1,'purple backpack')
shopModule:addBuyableItem({'blue backpack'}, 2002, 10, 1,'blue backpack')
shopModule:addBuyableItem({'gray backpack'}, 2003, 10, 1,'gray backpack')
shopModule:addBuyableItem({'golden backpack'}, 2004, 10, 1,'golden backpack')
shopModule:addBuyableItem({'camouflage'}, 3940, 10, 1,'camouflage')
shopModule:addBuyableItem({'pirate backpack'}, 5926, 50, 1,'pirate backpack')
shopModule:addBuyableItem({'beach'}, 5949, 10, 1,'beach')
shopModule:addBuyableItem({'fur backpack'}, 7342, 10, 1,'fur backpack')
shopModule:addBuyableItem({'brocade backpack'}, 9774, 10, 1,'brocade backpack')
shopModule:addBuyableItem({'orange backpack'}, 10519, 200, 1,'orange backpack')
shopModule:addBuyableItem({'minotaur backpack'}, 11238, 500, 1,'minotaur backpack')
shopModule:addBuyableItem({'expedition backpack'}, 11235, 500, 1,'expedition backpack')
shopModule:addBuyableItem({'crown backpack'}, 10522, 1500, 1,'crown backpack')
shopModule:addBuyableItem({'moon backpack'}, 10521, 80000, 1,'moon backpack')
shopModule:addBuyableItem({'demon backpack'}, 10518, 6000, 1,'demon backpack')


npcHandler:addModule(FocusModule:new())