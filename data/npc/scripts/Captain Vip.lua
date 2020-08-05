local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink() 							npcHandler:onThink() 						end

-- Don"t forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({"dragon land"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to sail to Dragon Land for " .. (getConfigInfo("freeTravel") and "free?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=31592, y=31974, z=7} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})

local travelNode = keywordHandler:addKeyword({"glorath"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to sail to Glorath for " .. (getConfigInfo("freeTravel") and "free?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=31642, y=31650, z=7} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})

local travelNode = keywordHandler:addKeyword({"dragon lair"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to sail to Dragon Lair for " .. (getConfigInfo("freeTravel") and "free?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=31681, y=31738, z=8} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})

local travelNode = keywordHandler:addKeyword({"wyrm spawn"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to sail to Wyrm Spawn for " .. (getConfigInfo("freeTravel") and "free?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=31365, y=31968, z=9} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})

local travelNode = keywordHandler:addKeyword({"gengia"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to sail to Gengia for " .. (getConfigInfo("freeTravel") and "free?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=31754, y=32339, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})

local travelNode = keywordHandler:addKeyword({"ice island"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to sail to Ice Island for " .. (getConfigInfo("freeTravel") and "free?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=31289, y=32275, z=7} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})
	
local travelNode = keywordHandler:addKeyword({"ethno"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to sail to Ethno for " .. (getConfigInfo("freeTravel") and "free?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=31423, y=33005, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})

keywordHandler:addKeyword({"travel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To {Gengia}, {Dragon Land}, {Glorath}, {Dragon Lair}, {Wyrm Spawn}, {Ice Island} and {Ethno}?"})
keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this ship."})
keywordHandler:addKeyword({"captain"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this ship."})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())